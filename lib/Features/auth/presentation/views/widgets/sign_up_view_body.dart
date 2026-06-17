import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/widgets/display_terms_and_condtions.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:fruits_ecommerce_app/constant.dart';
import 'package:fruits_ecommerce_app/core/helper_functions/show_snack_bar.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_bottom.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_password_text_form_field.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_text_form_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  late String name, email, password;
  late bool isTermsAccepted = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: fromKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'الاسم كامل',
                textInputType: TextInputType.text,
                onSaved: (value) => name = value!,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 16),
              CustomPasswordTextFormField(
                onSaved: (value) => password = value!,
              ),
              const SizedBox(height: 16),
              DisplayTermsAndCondtions(
                onChanged: (bool value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomBottom(
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    if (isTermsAccepted == false) {
                      showInfoSnackBar(
                        context,
                        'الرجاء الموافقه علي الشروط والاحكام',
                      );
                    } else {
                      fromKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            name: name,
                            email: email,
                            password: password,
                          );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              const SizedBox(height: 26),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
