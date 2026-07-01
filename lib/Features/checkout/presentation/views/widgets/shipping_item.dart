import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/utils/app_colors.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    this.onTap,
  });
  final String title, subTitle;
  final String price;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.only(top: 16, left: 13, right: 28, bottom: 16),
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              width: 1,
              color: isSelected ? AppColors.lightPrimaryColor : Colors.transparent,
            ),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: isSelected ? 10 : 18,
                height: isSelected ? 10: 18,
                decoration: ShapeDecoration(
                  color: isSelected
                          ? AppColors.primaryColor
                          : Colors.white,
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 1,
                      color: isSelected
                          ? AppColors.primaryColor
                          : Color(0xFF949D9E),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.semiBold13.copyWith(
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    subTitle,
                    style: AppTextStyles.regular13.copyWith(
                      color: Color(0xFF000000).withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  price,
                  style: AppTextStyles.bold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
