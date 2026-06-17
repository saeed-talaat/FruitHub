 import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';

AppBar buildAppBar({required String text ,required   context}) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios_new)
        ),
      centerTitle: true,
      title: Text(text, style: AppTextStyles.bold19,),
    );
  }