import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/utilities/constant.dart';
import 'package:flutter/material.dart';

class TheMealDBApiTheme {
  static ThemeData main() {
    return ThemeData(
      textTheme: textTheme,
      scaffoldBackgroundColor: white,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
    );
  }

  static TextTheme textTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: primaryFont,
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
      color: white,
    ),
    titleLarge: TextStyle(
      fontFamily: primaryFont,
      fontSize: 27.0,
      fontWeight: FontWeight.w700,
      color: primaryColor,
    ),
    titleMedium: TextStyle(
      fontFamily: primaryFont,
      fontWeight: FontWeight.w700,
      fontSize: 24.0,
    ),
    titleSmall: TextStyle(
      fontFamily: primaryFont,
      fontSize: 20.0,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: lightBlack,
      fontSize: 17.0,
    ),
    labelSmall: TextStyle(
      fontFamily: primaryFont,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
      fontSize: 15.0,
    ),
    bodyLarge: TextStyle(
      fontFamily: primaryFont,
      fontSize: 25.0,
    ),
    bodyMedium: TextStyle(
      fontFamily: primaryFont,
      fontSize: 17.0,
    ),
  );
}
