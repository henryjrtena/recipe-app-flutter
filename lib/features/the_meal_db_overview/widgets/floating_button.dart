import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    required this.showAddRecipeForm,
    Key? key,
  }) : super(key: key);

  final VoidCallback showAddRecipeForm;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: showAddRecipeForm,
      child: const Icon(
        Icons.add,
        size: 40.0,
      ),
    );
  }
}
