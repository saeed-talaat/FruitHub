import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:fruits_ecommerce_app/core/utils/app_colors.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';

class DisplayTermsAndCondtions extends StatefulWidget {
  const DisplayTermsAndCondtions({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<DisplayTermsAndCondtions> createState() => _DisplayTermsAndCondtionsState();
}

class _DisplayTermsAndCondtionsState extends State<DisplayTermsAndCondtions> {

  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(isChecked: isTermsAccepted, onChanged: (bool value) {
          isTermsAccepted = value;
          widget.onChanged(isTermsAccepted);
          setState(() {
            
          });
        }),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: Color(0xff949D9E),
                  ),
                ),
                TextSpan(text: ' '),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
