import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({
    super.key,
    required this.text,
    required this.stepNumber,
  });
  final String text;
  final int stepNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: Color(0xFFF2F3F3),
          child: Text(
            '$stepNumber',
            style: AppTextStyles.semiBold13.copyWith(color: Color(0xFF0C0D0D)),
          ),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.bold13.copyWith(color: Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}
