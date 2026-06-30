import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_bottom.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottom(
      onPressed: () {},
      text:
          'الدفع  ${context.watch<CartCubit>().cartEntity.calclateTotalPrice()} جنيه',
    );
  }
}
