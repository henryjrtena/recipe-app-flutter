import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:flutter/material.dart';

class MealDBTextField extends StatefulWidget {
  const MealDBTextField({
    required this.controller,
    this.onClearSearchField,
    this.maxLines = 1,
    super.key,
  });

  final TextEditingController controller;
  final VoidCallback? onClearSearchField;
  final int maxLines;

  @override
  State<MealDBTextField> createState() => _MealDBTextFieldState();
}

class _MealDBTextFieldState extends State<MealDBTextField> {
  bool showCloseButton = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onTextFieldChanged,
      controller: widget.controller,
      maxLines: widget.maxLines,
      style: Theme.of(context).textTheme.labelLarge,
      decoration: InputDecoration(
        suffixIcon: showCloseButton && widget.maxLines != 5
            ? GestureDetector(
                onTap: widget.onClearSearchField,
                child: const Icon(
                  Icons.cancel,
                  color: secondaryColor,
                  size: 35.0,
                ),
              )
            : null,
        hintText: enterYourMealHereLabel,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        contentPadding: const EdgeInsetsDirectional.all(20.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        filled: true,
        fillColor: const Color.fromRGBO(245, 245, 245, 1),
      ),
    );
  }

  void _onTextFieldChanged(String searchText) => setState(() => showCloseButton = searchText.isNotEmpty);
}
