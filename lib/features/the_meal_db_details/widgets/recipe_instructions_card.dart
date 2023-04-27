import 'package:recipe_app_flutter/features/the_meal_db_details/widgets/card_container.dart';
import 'package:recipe_app_flutter/utilities/spacing.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:flutter/material.dart';

class RecipeInstructionsCard extends StatelessWidget {
  const RecipeInstructionsCard({
    required this.instruction,
    super.key,
  });

  final String instruction;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            instructionsLabel,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          const VerticalSpacing(height: 10.0),
          Text(instruction),
        ],
      ),
    );
  }
}
