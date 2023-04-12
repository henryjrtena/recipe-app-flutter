import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class TheMealDBApiTheme {
  static ThemeData main() {
    return ThemeData(
      textTheme: textTheme,
      scaffoldBackgroundColor: white,
      inputDecorationTheme: const InputDecorationTheme(labelStyle: TextStyle(fontSize: 16.0)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
    );
  }

  static TextTheme textTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
      color: white,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 27.0,
      fontWeight: FontWeight.w700,
      color: primaryColor,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      fontSize: 24.0,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20.0,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      color: Colors.white70,
      fontSize: 15.0,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 25.0,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 17.0,
    ),
  );
}
