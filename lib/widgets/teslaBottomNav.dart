import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/constants.dart';

class TeslaBottomNav extends StatelessWidget {
  const TeslaBottomNav(
      {super.key, required this.selectedTab, required this.onTap});

  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTap,
        currentIndex: selectedTab,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          NavIcons.length,
          (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                NavIcons[index],
                color: index == selectedTab ? primaryColor : Colors.white54,
              ),
              label: ""),
        ));
  }
}

List NavIcons = [
  "assets/icons/Lock.svg",
  "assets/icons/Charge.svg",
  "assets/icons/Temp.svg",
  "assets/icons/Tyre.svg"
];
