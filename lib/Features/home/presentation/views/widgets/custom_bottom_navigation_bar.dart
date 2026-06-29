import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/home/domain/entities/bottom_navgation_bar_entity.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/navgation_bar_item.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
 final ValueChanged<int> onItemTapped;
  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNaBottomNavgationBarItems.asMap().entries.map((e) {
          int index = e.key;
          var entity = e.value;
          return Expanded(
            flex: selectedIndex == index ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                selectedIndex = index;
                widget.onItemTapped(selectedIndex);
                setState(() {
                  
                });
              },
              child: NavgationBarItem(isSelected: index == selectedIndex, bottomNavgationBarEntity: entity)));
        },).toList(),
      ),
    );
  }
}


