
import 'package:flutter/material.dart';

int selectU = 1;

Color textGrey = Color(0xffa0a0a0);

kTextStyle({
  Color color = Colors.white,
  double size = 14,
  FontWeight fontWeight = FontWeight.normal,
  double letter = 0,
  double height = 1,
}) {
  return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letter,
      height: height);
}

Color getColorIndicatorOne() {
  return Color(0xff1387d8);
}

Color getColorIndicatorTwo() {
  return Color(0x501387d8);
}