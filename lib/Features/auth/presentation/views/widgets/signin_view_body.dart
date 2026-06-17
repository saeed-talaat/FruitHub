import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruits_ecommerce_app/constant.dart';
import 'package:fruits_ecommerce_app/core/utils/app_colors.dart';
import 'package:fruits_ecommerce_app/core/utils/app_images.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_bottom.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_password_text_form_field.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_text_form_field.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomPasswordTextFormField(
                onSaved: (value) => password = value!,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: AppTextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              CustomBottom(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'تسجيل دخول',
              ),
              const SizedBox(height: 33),
              DontHaveAnAccountWidget(),
              const SizedBox(height: 33),
              OrDivider(),
              const SizedBox(height: 16),
               SocialLoginButton(
                title: 'تسجيل بواسطة جوجل',
                image: Assets.assetsImagesGoogleIcon,
                onPressed: (){
                  context.read<SigninCubit>().signInWithGoogle();
                },
              ),
              const SizedBox(height: 16),
              Platform.isIOS ? Column(
                 children: [
                   SocialLoginButton(
                    title: 'تسجيل بواسطة أبل',
                    image: Assets.assetsImagesAppleIcon,
                                 ),
                 ],
               ) : SizedBox(),
              const SizedBox(height: 16),
               SocialLoginButton(
                title: 'تسجيل بواسطة فيسبوك',
                image: Assets.assetsImagesFacebookIcon,
                onPressed: () {
                    context.read<SigninCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
