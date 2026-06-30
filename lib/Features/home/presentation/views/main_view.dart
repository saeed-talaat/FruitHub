import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/main_view_bloc_consumer.dart';

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
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: (int value) {
            currentViewIndex = value;
            setState(() {});
          },
        ),
        body: SafeArea(child: MainViewBlocConsumer(currentViewIndex: currentViewIndex)),
      ),
    );
  }
}

