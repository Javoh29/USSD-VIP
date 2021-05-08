
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:intl/intl.dart';

int selectU = 0;

Color textGrey = Color(0xffa0a0a0);
Color textGreyDark = Color(0xff828282);

var numFormat = NumberFormat('###,###', 'ru_RU');

List<String> fileNames = [
  'uzmobile',
  'ucell',
  'mobiuz',
  'beeline'
];

List<Color> mainColors = [
  Color(0xff1989d7),
  Color(0xff6758A0),
  Color(0xffE01D24),
  Color(0xffFFBE00),
];

List<Color> secondColors = [
  Color(0xffD7E1F6),
  Color(0xffCFCADF),
  Color(0xffFFC5C7),
  Color(0xffFFE7A0),
];

List<Color> indicatorColors = [
  Color(0x501387d8),
  Color(0x506758A0),
  Color(0x50E01D24),
  Color(0x50FFBE00),
];

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

changeStatusBar(Color color, bool isDark) async {
  await FlutterStatusbarcolor.setStatusBarWhiteForeground(isDark);
  await FlutterStatusbarcolor.setStatusBarColor(color, animate: false);
}