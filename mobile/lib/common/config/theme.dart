import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      color: ColorsTheme.white,
      elevation: 0
    ),
    scaffoldBackgroundColor: ColorsTheme.white,
    primaryColor: ColorsTheme.primary,
    textTheme: TextTheme(
      headline4: TextStyle(
        fontSize: 20,
        color: ColorsTheme.black,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        fontSize: 16,
        color: ColorsTheme.black,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        fontSize: 12,
        color: ColorsTheme.black,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        color: ColorsTheme.black,
      ),
      bodyText2: TextStyle(
        fontSize: 12,
        color: ColorsTheme.black,
      ),
    ),
  );
}

class ColorsTheme {
  static Color white = Color(0xFFebebeb);
  static Color black = Color(0xff232323);
  static Color primary = Color(0xff002859);
}

class TextStylesTheme {
  static TextStyle textTitleCard = TextStyle(
    fontSize: 16,
    color: ColorsTheme.black,
    fontWeight: FontWeight.bold,
  );
}