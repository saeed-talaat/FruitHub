import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/home/domain/entities/bottom_navgation_bar_entity.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/active_item.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/in_active_item.dart';

class NavgationBarItem extends StatelessWidget {
  const NavgationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavgationBarEntity,
  });
  final bool isSelected;
  final BottomNavgationBarEntity bottomNavgationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(image: bottomNavgationBarEntity.activeImage, name: bottomNavgationBarEntity.name,)
        : InActiveItem(image: bottomNavgationBarEntity.inActiveImage);
  }
}
