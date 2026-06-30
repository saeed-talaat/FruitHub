import 'package:equatable/equatable.dart';
import 'package:fruits_ecommerce_app/core/entity/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;
  CartItemEntity({this.count = 0, required this.productEntity});




 num calculateTotalPrice(){
    return productEntity.productPrice * count;
  }

  num caluclateTotalWeight(){
    return productEntity.unitAmount * count ;
  }

  void increasCount(){
    count++;
  }

  void decreaseCount(){
    count--;
  }
  
  @override
  List<Object?> get props =>  [productEntity];
}
