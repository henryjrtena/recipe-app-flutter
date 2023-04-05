import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:flutter/material.dart';

class TheMealDBApiOverviewPage extends StatelessWidget {
  const TheMealDBApiOverviewPage({
    required this.recipes,
    Key? key,
  }) : super(key: key);

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Text(recipe.strMeal);
        },
        itemCount: recipes.length,
      ),
    );
  }
}
