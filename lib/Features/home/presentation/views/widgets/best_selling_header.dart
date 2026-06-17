import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('الأكثر مبيعًا', style: AppTextStyles.bold16),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, BestSellingView.routeName),
          child: Text(
            'المزيد',
            style: AppTextStyles.regular13.copyWith(color: Color(0xFF949D9E)),
          ),
        ),
      ],
    );
  }
}
