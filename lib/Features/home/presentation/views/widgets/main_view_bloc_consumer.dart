import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/main_view_body.dart';
import 'package:fruits_ecommerce_app/core/helper_functions/show_snack_bar.dart';

class MainViewBlocConsumer extends StatelessWidget {
  const MainViewBlocConsumer({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartProductAdded) {
          showSuccessSnackBar(context, ' تم اضافه المنتج لي سلة');
        }
        if (state is CartItemRemoved) {
          showInfoSnackBar(context, ' تم ازالة المنتج لي سلة');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
