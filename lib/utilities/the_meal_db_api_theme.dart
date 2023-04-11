import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class TheMealDBApiTheme {
  static ThemeData main() {
    return ThemeData(
      textTheme: textTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
    );
  }

  static TextTheme textTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
      color: white,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 27.0,
      fontWeight: FontWeight.w700,
      color: primaryColor,
    ),
    titleMedium: GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      fontSize: 24.0,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 20.0,
    ),
    labelSmall: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      color: Colors.white70,
      fontSize: 15.0,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 25.0,
    ),
  );
}
