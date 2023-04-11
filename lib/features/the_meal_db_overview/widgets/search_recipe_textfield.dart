import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:flutter/material.dart';

class MealDBTextField extends StatelessWidget {
  const MealDBTextField({
    required this.controller,
    this.maxLines = 1,
    super.key,
  });

  final TextEditingController controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: const InputDecoration(
        hintText: enterYourMealHereLabel,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: grey,
          fontSize: 17.0,
        ),
        contentPadding: EdgeInsetsDirectional.all(20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        filled: true,
        fillColor: Color.fromRGBO(245, 245, 245, 1),
      ),
    );
  }
}
