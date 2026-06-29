
import 'package:fruits_ecommerce_app/core/entity/product_entity.dart';

// Assuming your ProductEntity class is defined in the same file or imported

List<ProductEntity> getDummyProducts() {
  return [
    ProductEntity(
      productName: 'Organic Wildflower Honey',
      productCode: 'HON-001',
      productDescription: 'Pure, raw, and unfiltered organic honey sourced from local farms.',
      productPrice: 15.99,
      isFeatured: true,
      imageUrl: null,
      expirationsMonths: 24,
      isOrganic: true,
      numberOfCalories: 64, 
      unitAmount: 1, 
    ),
    ProductEntity(
      productName: 'Whole Wheat Loaf',
      productCode: 'BRD-002',
      productDescription: 'Freshly baked daily, rich in fiber with no artificial preservatives.',
      productPrice: 3.49,
      isFeatured: false,
      imageUrl: null,
      expirationsMonths: 1,
      isOrganic: false,
      numberOfCalories: 80,
      unitAmount: 1,
    ),
    ProductEntity(
      productName: 'Fresh Green Apples',
      productCode: 'FRT-003',
      productDescription: 'Crisp, tart, and perfectly sweet green apples. Great for snacking.',
      productPrice: 4.99,
      isFeatured: true,
      imageUrl: null,
      expirationsMonths: 1,
      isOrganic: true,
      numberOfCalories: 52,
      unitAmount: 6, 
    ),
    ProductEntity(
      productName: 'Unsweetened Almond Milk',
      productCode: 'MLK-004',
      productDescription: 'Dairy-free almond milk fortified with calcium and vitamins.',
      productPrice: 5.49,
      isFeatured: false,
      imageUrl: null,
      expirationsMonths: 6,
      isOrganic: true,
      numberOfCalories: 30,
      unitAmount: 1, 
    ),
    ProductEntity(
      productName: 'Free-Range Eggs',
      productCode: 'EGG-005',
      productDescription: 'Farm-fresh, large brown eggs from pasture-raised hens.',
      productPrice: 6.99,
      isFeatured: true,
      imageUrl: null,
      expirationsMonths: 2,
      isOrganic: true,
      numberOfCalories: 72,
      unitAmount: 12, 
    ),
  ];
}