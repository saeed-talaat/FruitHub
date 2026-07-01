import 'package:fruits_ecommerce_app/Features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_ecommerce_app/Features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
   bool? payWitchCash;
   ShippingAddressEntity? shippingAddress;

  OrderEntity({
    required this.cartEntity,
    this.payWitchCash,
    this.shippingAddress,
  });
}
