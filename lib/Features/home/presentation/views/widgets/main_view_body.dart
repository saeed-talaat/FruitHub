import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/cart_view.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/products_view.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: [HomeView(), ProductsView(), CartView(), SizedBox()],
    );
  }
}