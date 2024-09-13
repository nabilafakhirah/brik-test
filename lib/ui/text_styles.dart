import 'package:flutter/material.dart';

TextStyle buildTextStyle({
  required num fontSize,
  FontWeight fontWeight = FontWeight.normal,
  required Color fontColor,
  TextDecoration? decoration,
  double? fontHeight,
  double? letterSpacing,
}) {
  final double fontSizeDouble = fontSize.toDouble();

  return TextStyle(
    fontFamily: 'Inter',
    fontSize: fontSizeDouble,
    fontWeight: fontWeight,
    color: fontColor,
    height: fontHeight,
    decoration: decoration,
    letterSpacing: letterSpacing,
  );
}