import 'package:fruits_ecommerce_app/core/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  int sellingCount;

  ProductModel({
    required super.productName,
    required super.productCode,
    required super.productDescription,
    required super.productPrice,
    required super.isFeatured,
    super.image,
    required super.imageUrl,
    required super.expirationsMonths,
    required super.isOrganic,
    required super.numberOfCalories,
    required super.unitAmount,
    this.sellingCount = 0,
  });

    ProductEntity toEntity() {
    return ProductEntity(
      productName: productName,
      productCode: productCode,
      productDescription: productDescription,
      productPrice: productPrice,
      isFeatured: isFeatured,
      expirationsMonths: expirationsMonths,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      imageUrl: imageUrl
      
    );
  }

  factory ProductModel.fromJson({required Map<String, dynamic> json}) {
    return ProductModel(
      productName: json['productName'],
      productCode: json['productCode'],
      productDescription: json['productDescription'],
      productPrice: json['productPrice'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationsMonths: json['expirationsMonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      sellingCount: json['sellingCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productCode': productCode,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'sellingCount': sellingCount,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
    };
  }

  factory ProductModel.fromEntity({required ProductEntity productEntity}) {
    return ProductModel(
      productName: productEntity.productName,
      productCode: productEntity.productCode,
      productDescription: productEntity.productDescription,
      productPrice: productEntity.productPrice,
      isFeatured: productEntity.isFeatured,
      image: productEntity.image,
      imageUrl: productEntity.imageUrl,
      expirationsMonths: productEntity.expirationsMonths,
      isOrganic: productEntity.isOrganic,
      numberOfCalories: productEntity.numberOfCalories,
      unitAmount: productEntity.unitAmount,
    );
  }
}
