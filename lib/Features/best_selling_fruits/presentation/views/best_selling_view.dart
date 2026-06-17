import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'BestSellingView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BestSellingViewBody()),
    );
  }
}