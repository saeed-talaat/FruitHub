import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/widgets/signup_view_bloc_consumer.dart';
import 'package:fruits_ecommerce_app/core/services/get_it_service.dart';
import 'package:fruits_ecommerce_app/core/utils/build_app_bar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'SignUpView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: 'حساب جديد', context: context, showNotafication: false),
      body: BlocProvider(
        create: (context) => SignupCubit(authRepo: getIt<AuthRepo>()),
        child: const SignupViewBlocConsumer(),
      ),
    );
  }
}


