import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_ecommerce_app/core/utils/build_app_bar.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const String routeName = '/checkout_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : buildAppBar(
        text: 'الشحن',
        context: context,
        showNotafication: false,
      ),
      body: const CheckoutViewBody(),
    );
  }
}

