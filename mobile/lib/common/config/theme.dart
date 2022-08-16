import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      color: ColorsTheme.white,
      elevation: 0
    ),
    scaffoldBackgroundColor: ColorsTheme.white,
    primaryColor: ColorsTheme.primary,
  );
}

class ColorsTheme {
  static Color white = Color(0xFFebebeb);
  static Color primary = Color(0xff002859);
}