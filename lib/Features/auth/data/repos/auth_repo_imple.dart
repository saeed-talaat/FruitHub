import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_ecommerce_app/Features/auth/data/models/user_model.dart';
import 'package:fruits_ecommerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:fruits_ecommerce_app/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_ecommerce_app/constant.dart';
import 'package:fruits_ecommerce_app/core/errors/custom_exceptions.dart';
import 'package:fruits_ecommerce_app/core/errors/failures.dart';
import 'package:fruits_ecommerce_app/core/services/database_service.dart';
import 'package:fruits_ecommerce_app/core/services/firebase_auth_service.dart';
import 'package:fruits_ecommerce_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_ecommerce_app/core/utils/backend_endpoint.dart';

class AuthRepoImple implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImple({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      addUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImple.createUserWithEmailAndPassword : ${e.toString()}',
      );
      return left(
        ServerFailure(errorMessage: 'حدث خطاء ما الرجاء محاولة مرة اخري'),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      log(
        'Exception in AuthRepoImple.signInWithEmailAndPassword : ${e.toString()}',
      );
      return left(
        ServerFailure(errorMessage: 'حدث خطاء ما الرجاء محاولة مرة اخري'),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFireBaseUser(user!);
      bool isUserExists = await checkIfUserExists(uid: userEntity.uId);
      if (isUserExists) {
        await getUserData(uid: userEntity.uId);
      } else {
        
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImple.signInWithGoogle : ${e.toString()}');
      return left(
        ServerFailure(errorMessage: 'حدث خطاء ما الرجاء محاولة مرة اخري'),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFireBaseUser(user!);
      bool isUserExists = await checkIfUserExists(uid: userEntity.uId);
      if (isUserExists) {
        await getUserData(uid: userEntity.uId);
      } else {
        
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);

      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImple.signInWithFacebook : ${e.toString()}');
      return left(
        ServerFailure(errorMessage: 'حدث خطاء ما الرجاء محاولة مرة اخري'),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<dynamic> addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(userEntity: user).toMap(),
      docuementId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      docuementId: uid,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future<bool> checkIfUserExists({required String uid}) async {
    return await databaseService.checkIfDataExists(
      path: BackendEndpoint.isUserDataExists,
      docuementId: uid,
    );
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(userEntity: user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
