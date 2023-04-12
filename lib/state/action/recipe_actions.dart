import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:recipe_app_flutter/api/api_service.dart';
import 'package:recipe_app_flutter/state/action/actions.dart';
import 'package:recipe_app_flutter/state/app_state.dart';

/// This is responsible for executing the action of fetching a recipe and updating the application state accordingly.
class GetRecipeAction extends LoadingAction {
  static const key = "get-recipe-action";

  GetRecipeAction({required this.mealName}) : super(actionKey: key);

  final String mealName;

  @override
  Future<AppState> reduce() async {
    final recipe = await ApiService().theMealDBApi.getRecipe(mealName: mealName);

    final recipes = [...state.recipes, recipe];

    return state.copyWith(recipes: recipes);
  }
}

/// This action is responsible for setting the recipe details by the given index.
class SetRecipeDetailsAction extends ReduxAction<AppState> {
  SetRecipeDetailsAction({required this.recipeIndex});

  final int recipeIndex;

  @override
  AppState reduce() {
    final recipe = state.recipes[recipeIndex];
    return state.copyWith(recipeDetails: recipe);
  }
}

/// This action is responsible for disposing the state of the recipe details.
class OnDisposeRecipeDetailsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(recipeDetails: null);
}

/// This action is responsible for updating the notes of a recipe.
class OnUpdateRecipeNotesAction extends ReduxAction<AppState> {
  OnUpdateRecipeNotesAction({required this.recipeNote});

  final String recipeNote;

  @override
  AppState reduce() {
    final recipes = [...state.recipes];

    final recipeIndex = recipes.indexOf(state.recipeDetails!);

    recipes[recipeIndex] = recipes[recipeIndex].copyWith(note: recipeNote);

    return state.copyWith(recipes: recipes, recipeDetails: recipes[recipeIndex]);
  }
}
