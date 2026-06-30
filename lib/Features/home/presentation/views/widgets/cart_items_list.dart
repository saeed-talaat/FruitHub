import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/cart_item.dart';
import 'package:fruits_ecommerce_app/constant.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CartItem(cartItemEntity: cartItems[index],),
        );
      }, separatorBuilder: (BuildContext context, int index) { 
        return Divider(
          height: 22,
          color: Color(0xFFF1F1F5),
        );
       },
    );
  }
}
