import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class TempBtn extends StatelessWidget {
  const TempBtn(
      {super.key,
      required this.svgSrc,
      this.isActive = false,
      required this.press,
      required this.title,
      required this.activeColor});

  final String svgSrc, title;
  final bool isActive;
  final VoidCallback press;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutBack,
            height: isActive ? 70 : 50,
            width: isActive ? 70 : 50,
            child: SvgPicture.asset(
              svgSrc,
              color: isActive ? activeColor : Colors.white54,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutBack,
            style: TextStyle(
                fontSize: 16,
                color: isActive ? activeColor : Colors.white38,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
            child: Text(
              title.toUpperCase(),
            ),
          )
        ],
      ),
    );
  }
}
