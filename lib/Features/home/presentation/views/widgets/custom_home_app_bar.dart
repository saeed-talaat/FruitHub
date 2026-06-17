import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/helper_functions/get_user.dart';
import 'package:fruits_ecommerce_app/core/utils/app_images.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var userEntity = getUser();
    return ListTile(
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.regular16.copyWith(color: Color(0xFF949D9E)),
      ),
      subtitle: Text(
        userEntity?.name ?? 'أحمد مصطفي',
        style: AppTextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
      ),
      leading: Image.asset(Assets.assetsImagesHomeProfile),
      trailing: Container(
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: Color(0xFFEEF8ED),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.assetsImagesNotification),
      ),
    );
  }
}
