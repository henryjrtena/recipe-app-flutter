import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:recipe_app_flutter/features/the_meal_db_overview/widgets/empty_recipes_view.dart';
import 'package:recipe_app_flutter/features/the_meal_db_overview/widgets/recipe_card.dart';
import 'package:recipe_app_flutter/utilities/spacing.dart';
import 'package:flutter/material.dart';

class RecipeListView extends StatelessWidget {
  const RecipeListView({
    required this.recipes,
    required this.onAddRecipe,
    required this.label,
    super.key,
  });

  final List<Recipe> recipes;
  final VoidCallback onAddRecipe;
  final String label;

  @override
  Widget build(BuildContext context) {
    if (recipes.isEmpty) return EmptyRecipesView(onAddRecipe: onAddRecipe);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const VerticalSpacing(height: 20.0),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (_, __) => const VerticalSpacing(height: 20.0),
            itemBuilder: (_, index) {
              final recipe = recipes[index];
              return RecipeCard(
                recipe: recipe,
                recipeIndex: index,
              );
            },
            itemCount: recipes.length,
          ),
        )
      ],
    );
  }
}
