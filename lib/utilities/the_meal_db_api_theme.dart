import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/utilities/colors.dart';

class TheMealDBApiTheme {
  static ThemeData main() {
    return ThemeData(
      fontFamily: 'Inter',
    );
  }

  static ButtonStyle fluidButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      minimumSize: const Size(double.infinity, 40.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
