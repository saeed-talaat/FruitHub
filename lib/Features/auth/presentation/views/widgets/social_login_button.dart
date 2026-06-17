import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key, required this.title, required this.image,  this.onPressed});
  final String title;
  final VoidCallback? onPressed;
  final String image;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Color(0xFFDCDEDE), width: 1),
        ),
      ),
      onPressed: onPressed,
      child: ListTile(
        visualDensity: VisualDensity(
          vertical: VisualDensity.minimumDensity,
        ),
        title: Text(
          title,
          style: AppTextStyles.semiBold16,
          textAlign: TextAlign.center,
        ),
        leading: SvgPicture.asset(image),
      ),
    );
  }
}
