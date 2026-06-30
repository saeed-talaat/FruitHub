
import 'package:fruits_ecommerce_app/Features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_ecommerce_app/core/entity/product_entity.dart';

class CartEntity {
  List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  void addCartItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }

  bool isExist(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product, count: 1);
  }

  num calclateTotalPrice() {
    num sum = 0;
    for (var cartItem in cartItems) {
      sum += cartItem.calculateTotalPrice();
    }
    return sum;
  }


  void deleteCartItem(CartItemEntity cartItem){
    cartItems.remove(cartItem);
  }
}
