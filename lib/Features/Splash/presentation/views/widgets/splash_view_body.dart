import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/signin_view.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/main_view.dart';
import 'package:fruits_ecommerce_app/Features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fruits_ecommerce_app/constant.dart';
import 'package:fruits_ecommerce_app/core/services/firebase_auth_service.dart';
import 'package:fruits_ecommerce_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_ecommerce_app/core/utils/app_images.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool isOnboardingSeen = Prefs.getBool(kIsOnBoardingSeen);

  @override
  void initState() {
    super.initState();
    excuteNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.assetsImagesPlant)],
        ),
        Center(child: SvgPicture.asset(Assets.assetsImagesLogo)),
        SvgPicture.asset(Assets.assetsImagesSplashBottom, fit: BoxFit.fill),
      ],
    );
  }

  Future<void> excuteNavigate() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    if (isOnboardingSeen) {
      var isLoggedIn = FirebaseAuthService().isLoggedIn();
      if (isLoggedIn) {
        Navigator.pushNamed(context, MainView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, SigninView.routeName);
      }
    } else {
      Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    }
  }
}
