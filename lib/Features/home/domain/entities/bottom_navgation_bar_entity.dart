import 'package:fruits_ecommerce_app/core/utils/app_images.dart';

class BottomNavgationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavgationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavgationBarEntity> get bottomNaBottomNavgationBarItems => [
  BottomNavgationBarEntity(
    activeImage: Assets.assetsImagesHomeActive,
    inActiveImage: Assets.assetsImagesHomeInActive,
    name: 'الرئيسية',
  ),
  BottomNavgationBarEntity(
    activeImage: Assets.assetsImagesProductsActive,
    inActiveImage: Assets.assetsImagesProductsInActive,
    name: 'المنتجات',
  ),
  BottomNavgationBarEntity(
    activeImage: Assets.assetsImagesShoppingcartActive,
    inActiveImage: Assets.assetsImagesShoppingcartInActive,
    name: 'سلة التسوق',
  ),
  BottomNavgationBarEntity(
    activeImage: Assets.assetsImagesProfileActive,
    inActiveImage: Assets.assetsImagesProfileInActive,
    name: 'حسابي',
  ),
];
