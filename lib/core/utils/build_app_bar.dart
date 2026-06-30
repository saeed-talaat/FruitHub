 import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/utils/app_images.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

AppBar buildAppBar({required String text ,required   context ,  bool showNotafication = true , bool showArrow = true}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      leading: Visibility(
        visible: showArrow,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new)
          ),
      ) ,
      centerTitle: true,
      title: Text(text, style: AppTextStyles.bold19,),
      actions:    [
        Visibility(
          visible: showNotafication,
          child: Container(
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: Color(0xFFEEF8ED),
            shape: OvalBorder(),
          ),
          child: SvgPicture.asset(Assets.assetsImagesNotification),
                ),
        ),
      ] ,
    );
  }