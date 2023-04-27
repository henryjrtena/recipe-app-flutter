import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class Button {
  static ButtonStyle fluidButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      minimumSize: const Size(double.infinity, 40.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }

  static ButtonStyle circleAddButton({Color? color = primaryColor}) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(8.0),
      shape: const CircleBorder(),
    );
  }

  static ButtonStyle leftBorderedRadius(bool isActive) {
    return ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: isActive ? primaryColor : white,
      padding: const EdgeInsets.all(10.0),
      side: const BorderSide(width: 1.0, color: lightGrey),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        ),
      ),
    );
  }

  static ButtonStyle rightBorderedRadius(bool isActive) {
    return ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: isActive ? primaryColor : white,
      padding: const EdgeInsets.all(10.0),
      side: const BorderSide(width: 1.0, color: lightGrey),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
    );
  }
}
