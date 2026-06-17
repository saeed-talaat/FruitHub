import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:fruits_ecommerce_app/Features/auth/domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit({required this.authRepo}) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(SigninFailure(errorMessage: failure.errorMessage)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(SigninFailure(errorMessage: failure.errorMessage)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }


  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();

    result.fold(
      (failure) => emit(SigninFailure(errorMessage: failure.errorMessage)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }
}
