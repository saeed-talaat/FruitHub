import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/widgets/signin_view_bloc_consumer.dart';
import 'package:fruits_ecommerce_app/core/services/get_it_service.dart';
import 'package:fruits_ecommerce_app/core/utils/build_app_bar.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(text: 'تسجيل دخول', context: context),
        body: SigninViewBlocConsumer(),
      ),
    );
  }
}


