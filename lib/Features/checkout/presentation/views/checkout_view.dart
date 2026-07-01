import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_ecommerce_app/Features/home/domain/entities/cart_entity.dart';
import 'package:fruits_ecommerce_app/core/utils/build_app_bar.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = '/checkout_view';
  final CartEntity cartEntity ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : buildAppBar(
        text: 'الشحن',
        context: context,
        showNotafication: false,
      ),
      body: Provider.value(
        value: OrderEntity(cartEntity: cartEntity),
        child: const CheckoutViewBody(),
      ),
    );
  }
}

