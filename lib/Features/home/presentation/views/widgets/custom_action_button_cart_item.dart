import 'package:flutter/material.dart';

class CustomActionButtonCartItem extends StatelessWidget {
  const CustomActionButtonCartItem({
    super.key, required this.backGroundColor, required this.iconData, required this.iconColor,
  });
  final Color backGroundColor;
  final IconData iconData;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:backGroundColor,
      radius: 15,
      child: Icon(iconData, color: iconColor),
    );
  }
}
