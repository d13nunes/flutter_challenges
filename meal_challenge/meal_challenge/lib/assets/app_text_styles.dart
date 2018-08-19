import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle title18 = title(fontSize: 18.0);

  static TextStyle title({double fontSize}) => TextStyle(
        fontSize: fontSize,
        letterSpacing: 0.0,
        fontWeight: FontWeight.w800,
      );
}
