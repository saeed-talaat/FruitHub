import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_ecommerce_app/core/errors/custom_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {

 
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
  Future<User> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            
            email: emailAddress,
            password: password,
          );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword . code : ${e.code}  message : ${e.message} ',
      );
      if (e.code == 'network-request-failed') {
        throw CustomExceptions(
          errorMessage:
              'تعذر الاتصال بالخادم. يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى.',
        );
      }
      if (e.code == 'invalid-email') {
        throw CustomExceptions(
          errorMessage:
              'عذراً، يبدو أن صيغة البريد الإلكتروني المدخلة غير صحيحة. يرجى التأكد من كتابته بشكل صحيح',
        );
      }
      if (e.code == 'weak-password') {
        throw CustomExceptions(errorMessage: 'الرقم السري ضعيف جدا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(
          errorMessage: 'لقد قمت بالتسجيل مسبقا.الرجاء تسجيل الدخول',
        );
      } else {
        throw CustomExceptions(errorMessage: e.toString());
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()} ',
      );
      throw CustomExceptions(
        errorMessage: '  لقد حدث خطاء ما الرجاء محاوله مرة اخري',
      );
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword . code : ${e.code}  message : ${e.message} ',
      );
      if (e.code == 'invalid-email') {
        throw CustomExceptions(
          errorMessage:
              'عذراً، يبدو أن صيغة البريد الإلكتروني المدخلة غير صحيحة. يرجى التأكد من كتابته بشكل صحيح',
        );
      }
      if (e.code == 'network-request-failed') {
        throw CustomExceptions(
          errorMessage:
              'تعذر الاتصال بالخادم. يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى.',
        );
      }
      if (e.code == 'user-not-found') {
        throw CustomExceptions(
          errorMessage:
              'لا يوجد حساب مرتبط بهذا البريد الإلكتروني. يرجى التحقق من البريد المدخل أو إنشاء حساب جديد.',
        );
      } else if (e.code == 'invalid-credential') {
        throw CustomExceptions(
          errorMessage: 'البريد الالكتروني او كلمة المرور غير صحيح ',
        );
      } else {
        throw CustomExceptions(
          errorMessage: 'حدث خطاء ما الرجاء المحاولة مرة اخري',
        );
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()} ',
      );
      throw CustomExceptions(
        errorMessage: 'حدث خطاء ما الرجاء المحاولة مرة اخري',
      );
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();

      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

      if (googleUser == null) {
        throw CustomExceptions(errorMessage: 'حصل خطاء اثناء تسجيل دخول');
      }

      final scopes = ['email', 'profile'];
      final clientAuth = await googleUser.authorizationClient.authorizeScopes(
        scopes,
      );

      final credential = GoogleAuthProvider.credential(
        idToken: googleUser.authentication.idToken,
        accessToken: clientAuth.accessToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(
        credential,
      )).user;
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithGoogle : ${e.toString()} ',
      );
      throw CustomExceptions(errorMessage: 'حصل خطاء اثناء تسجيل دخول');
    }
  }

  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

        return (await FirebaseAuth.instance.signInWithCredential(
          facebookAuthCredential,
        )).user;
      } else if (loginResult.status == LoginStatus.cancelled) {
        throw CustomExceptions(errorMessage: 'تم إلغاء عملية تسجيل الدخول');
      } else {
        throw CustomExceptions(errorMessage: 'فشل تسجيل الدخول من فيسبوك');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithFacebook : $e');
      throw CustomExceptions(errorMessage: 'حصل خطأ أثناء تسجيل الدخول');
    }
  }


  bool isLoggedIn(){
    return FirebaseAuth.instance.currentUser != null;
  }
}
