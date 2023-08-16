import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({super.key, required this.isLock, required this.press});

  final VoidCallback press;
  final bool isLock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOutBack,
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: isLock
              ? SvgPicture.asset(
                  "assets/icons/door_lock.svg",
                  key: ValueKey("Lock"),
                )
              : SvgPicture.asset(
                  "assets/icons/door_unlock.svg",
                  key: ValueKey("Unlock"),
                ),
        ));
  }
}
