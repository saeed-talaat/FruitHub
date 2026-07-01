import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/utils/app_decorations.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
      width: double.infinity,
      decoration: AppDecorations.greyBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المجموع الفرعي :',
                style: AppTextStyles.regular13.copyWith(
                  color: Color(0xFF4E5556),
                ),
              ),
              Text('150 جنيه', style: AppTextStyles.semiBold16),
            ],
          ),

          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'التوصيل  :',
                style: AppTextStyles.regular13.copyWith(
                  color: Color(0xFF4E5556),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  '30جنية',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: Color(0xFF4E5556),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 9),
          Divider(
            thickness: 0.5,
            indent: 32,
            endIndent: 32,
            color: Color(0xFFCACECE),
          ),
          SizedBox(height: 9),



            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الكلي',
                style: AppTextStyles.bold16
              ),
              Text('180 جنيه', style: AppTextStyles.bold16),
            ],
          ),
        ],
      ),
    );
  }
}
