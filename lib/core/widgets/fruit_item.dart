import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/entity/product_entity.dart';
import 'package:fruits_ecommerce_app/core/utils/app_colors.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined, color: Colors.black),
            ),
          ),

          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20),
              productEntity.imageUrl != null ?  SizedBox(
                  height: 100,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child:   Center(
                      child:  Image.network(
                        productEntity.imageUrl!,
                        fit: BoxFit.contain,
                      ) 
                    ) 
                  ),
                ) :  Flexible(
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                ListTile(
                  title: Text(
                    productEntity.productName,
                    style: AppTextStyles.semiBold13.copyWith(
                      color: Color(0xff0C0D0D),
                    ),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${productEntity.productPrice}جنية',
                          style: AppTextStyles.semiBold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(text: ' '),
                        TextSpan(
                          text: '/',
                          style: AppTextStyles.semiBold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                        TextSpan(text: ''),
                        TextSpan(
                          text: 'الكيلو',
                          style: AppTextStyles.semiBold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.add, color: Colors.white, size: 28),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
