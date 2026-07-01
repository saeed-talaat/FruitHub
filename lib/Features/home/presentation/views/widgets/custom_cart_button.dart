import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_bottom.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isActive,
      child: CustomBottom(
        onPressed: () {
          Navigator.pushNamed(
            context,
            CheckoutView.routeName,
            arguments: context.read<CartCubit>().cartEntity,
          );
        },
        text:
            'الدفع  ${context.watch<CartCubit>().cartEntity.calclateTotalPrice()} جنيه',
      ),
    );
  }
}
