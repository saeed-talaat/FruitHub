import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/cart_item_action_button_bloc_consumer.dart';
import 'package:fruits_ecommerce_app/core/utils/app_colors.dart';
import 'package:fruits_ecommerce_app/core/utils/app_images.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: BoxDecoration(color: Color(0xFFF3F5F7)),
            child: Center(
              child: Image.network(cartItemEntity.productEntity.imageUrl!),
            ),
          ),

          SizedBox(width: 17),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cartItemEntity.productEntity.productName,
                      style: AppTextStyles.bold13,
                    ),
                    // Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().deleteCartItem(
                          cartItemEntity,
                        );
                      },
                      child: SvgPicture.asset(Assets.assetsImagesTrash),
                    ),
                  ],
                ),
                Text(
                  '${cartItemEntity.caluclateTotalWeight()} كم',
                  style: AppTextStyles.regular13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CartItemActionButtonBlocConsumer(
                      cartItemEntity: cartItemEntity,
                    ),
                    Text(
                      ' ${cartItemEntity.calculateTotalPrice()}   جنيه ',
                      style: AppTextStyles.bold16.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


