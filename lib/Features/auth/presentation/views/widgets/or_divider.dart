import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomDivider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text('أو', style: AppTextStyles.semiBold16),
        ),
        Expanded(child: CustomDivider()),
      ],
    );
  }
}
