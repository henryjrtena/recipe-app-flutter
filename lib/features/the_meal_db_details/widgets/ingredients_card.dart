import 'package:recipe_app_flutter/api/model/ingredient.dart';
import 'package:recipe_app_flutter/features/the_meal_db_details/widgets/card_container.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:flutter/material.dart';

class IngredientsCard extends StatelessWidget {
  const IngredientsCard({
    required this.ingredients,
    super.key,
  });

  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            mainLabel,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          for (final ingredient in ingredients)
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 80.0,
                    child: Text(ingredient.measure),
                  ),
                  Text(
                    ingredient.name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
