import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/custom_action_button_cart_item.dart';
import 'package:fruits_ecommerce_app/core/utils/app_colors.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            context.read<CartCubit>().increaseCartItemCount(
              cartItemEntity: cartItemEntity,
            );
          },
          child: CustomActionButtonCartItem(
            backGroundColor: AppColors.primaryColor,
            iconData: Icons.add,
            iconColor: Colors.white,
          ),
        ),
        SizedBox(width: 16),
        Text(cartItemEntity.count.toString(), style: AppTextStyles.bold16),
        SizedBox(width: 16),
        GestureDetector(
          onTap: () {
             context.read<CartCubit>().decreaseCartItemCount(
              cartItemEntity: cartItemEntity,
            );
          },
          child: CustomActionButtonCartItem(
            backGroundColor: Color(0xFFF1F1F5),
            iconData: Icons.remove,
            iconColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
