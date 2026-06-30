import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/domain/entities/cart_entity.dart';
import 'package:fruits_ecommerce_app/Features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_ecommerce_app/core/entity/product_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);
  void addProduct({required ProductEntity productEntity}) {
    var cartItem = cartEntity.getCartItem(productEntity);
    if (cartEntity.isExist(productEntity)) {
      cartItem.increasCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }

    emit(CartProductAdded());
  }

  void deleteCartItem(CartItemEntity cartItemEntity) {
    cartEntity.deleteCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }

  void increaseCartItemCount({required CartItemEntity cartItemEntity}){
    cartItemEntity.increasCount();
    emit(CartItemIncresseCount());
  }


  void decreaseCartItemCount({required CartItemEntity cartItemEntity}){
    if (cartItemEntity.count != 1) {
      cartItemEntity.decreaseCount();  
      emit(CartItemIncresseCount());
    }
    else{
      deleteCartItem(cartItemEntity);
    }
    
  }
  
}
