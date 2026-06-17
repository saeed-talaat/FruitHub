import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:fruits_ecommerce_app/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failures , UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });


  Future<Either<Failures , UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failures , UserEntity>> signInWithGoogle();
  Future<Either<Failures , UserEntity>> signInWithFacebook();

  Future addUserData({required UserEntity user});
  Future <UserEntity> getUserData({required String uid});
  Future<bool> checkIfUserExists({required String uid});

  
}
