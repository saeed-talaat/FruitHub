import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/utils/app_images.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.numberOfProducts});
  final int numberOfProducts;
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$numberOfProducts نتائج', style: AppTextStyles.bold16),
        SvgPicture.asset(Assets.assetsImagesArrowSwapHorizontal),
      ],
    );
  }
}