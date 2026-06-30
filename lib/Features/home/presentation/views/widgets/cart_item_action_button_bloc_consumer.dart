import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/cart_item_action_button.dart';

class CartItemActionButtonBlocConsumer extends StatelessWidget {
  const CartItemActionButtonBlocConsumer({
    super.key,
    required this.cartItemEntity,
  });

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return CartItemActionButton(cartItemEntity: cartItemEntity);
      },
    );
  }
}