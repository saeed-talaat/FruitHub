
import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/signin_view.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/signup_view.dart';
import 'package:fruits_ecommerce_app/Features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/home_view.dart';
import 'package:fruits_ecommerce_app/Features/onboarding/presentation/views/onboarding_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());     
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView()); 
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());   
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}