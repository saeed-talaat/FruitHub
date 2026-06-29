import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/products_view.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'HomeView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (int value) {
          currentViewIndex = value;
          setState(() {});
        },
      ),
      body: IndexedStack(index: currentViewIndex, children: views),
    );
  }
}

List<Widget> views = [HomeView(), ProductsView(), SizedBox(), SizedBox()];
