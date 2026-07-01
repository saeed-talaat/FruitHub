import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/cart_items_list.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:fruits_ecommerce_app/core/utils/build_app_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  buildAppBar(
                    text: 'السلة',
                    context: context,
                    showNotafication: false,
                  ),
                  const SizedBox(height: 16),
                  CartHeader(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Visibility(
                visible: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                    ? false
                    : true,
                child: Divider(height: 22, color: Color(0xFFF1F1F5)),
              ),
            ),
            CartItemsList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),

            SliverToBoxAdapter(
              child: Visibility(
                visible: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                    ? false
                    : true,
                child: Divider(height: 22, color: Color(0xFFF1F1F5)),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.05,
          right: 16,
          left: 16,
          child: CustomCartButton(isActive: context.read<CartCubit>().cartEntity.cartItems.isNotEmpty),
        ),
      ],
    );
  }
}

