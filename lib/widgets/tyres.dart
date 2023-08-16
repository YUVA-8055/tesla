import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Widget> tyres(BoxConstraints constraints) {
  return [
    Positioned(
        left: constraints.maxWidth * 0.19,
        top: constraints.maxHeight * 0.23,
        child: SvgPicture.asset(
          "assets/icons/FL_Tyre.svg",
        )),
    Positioned(
        right: constraints.maxWidth * 0.19,
        top: constraints.maxHeight * 0.23,
        child: SvgPicture.asset("assets/icons/FL_Tyre.svg")),
    Positioned(
        left: constraints.maxWidth * 0.19,
        bottom: constraints.maxHeight * 0.23,
        child: SvgPicture.asset("assets/icons/FL_Tyre.svg")),
    Positioned(
        right: constraints.maxWidth * 0.19,
        bottom: constraints.maxHeight * 0.23,
        child: SvgPicture.asset("assets/icons/FL_Tyre.svg"))
  ];
}
