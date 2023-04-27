import 'package:recipe_app_flutter/features/the_meal_db_details/the_meal_db_details_connector.dart';
import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    required this.recipe,
    required this.recipeIndex,
    super.key,
  });

  final Recipe recipe;
  final int recipeIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TheMealDBApiDetailsConnector(recipeIndex: recipeIndex),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(recipe.strMealThumb),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: 150.0,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: recipeCardBlackGradient,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  recipe.strCategory,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  recipe.strMeal,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
