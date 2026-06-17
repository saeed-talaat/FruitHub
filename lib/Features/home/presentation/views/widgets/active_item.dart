import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/utils/app_colors.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.name});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
          color: Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
      
              child: Center(child: SvgPicture.asset(image)),
            ),
            const SizedBox(width: 4,),
            Text(name,style: AppTextStyles.semiBold11.copyWith(color: AppColors.primaryColor),)
          ],
        ),
      ),
    );
  }
}
