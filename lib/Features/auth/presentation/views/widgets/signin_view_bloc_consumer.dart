import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/home_view.dart';
import 'package:fruits_ecommerce_app/core/helper_functions/show_snack_bar.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_modal_progress_hud.dart';

class SigninViewBlocConsumer extends StatelessWidget {
  const SigninViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninFailure) {
          showErrorSnackBar(context, state.errorMessage);
        } else if (state is SigninSuccess) {
          showSuccessSnackBar(context, 'تم تسجيل الدخول بنجاح');
          Navigator.pushNamed(context, HomeView.routeName);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          message: 'يرجى الانتظار، جاري التحقق من البيانات...',
          isLoading: state is SigninLoading ? true : false,
          child: SigninViewBody(),
        );
      },
    );
  }
}