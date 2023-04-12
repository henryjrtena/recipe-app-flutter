import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/features/the_meal_db_overview/the_meal_db_overview_connector.dart';
import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:recipe_app_flutter/state/action/recipe_actions.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

class TheMealDBApiOverviewVmFactory extends VmFactory<AppState, TheMealDBApiOverviewConnector> {
  @override
  Vm fromStore() => TheMealDBApiOverviewVm(
        recipes: _getRecipes,
        searchedRecipes: _getSearchedRecipes,
        onGetRecipeAction: _onGetRecipeAction,
        onSearchedRecipeAction: _onSearchedRecipeAction,
        onDisposeSearchedRecipe: _onDisposeSearchedRecipeAction,
      );

  List<Recipe> get _getRecipes {
    if (state.recipes.isEmpty) return List.empty();
    return state.recipes;
  }

  List<Recipe> get _getSearchedRecipes {
    if (state.recipes.isEmpty) return List.empty();
    return state.searchedRecipes;
  }

  void _onGetRecipeAction(String mealName) => dispatchAsync(GetRecipeAction(mealName: mealName));

  void _onSearchedRecipeAction(String searchText) => dispatchAsync(OnSearchRecipeAction(searchText: searchText));

  void _onDisposeSearchedRecipeAction() => dispatchSync(OnDisposeSearchRecipeAction());
}

class TheMealDBApiOverviewVm extends Vm {
  TheMealDBApiOverviewVm({
    required this.recipes,
    required this.searchedRecipes,
    required this.onGetRecipeAction,
    required this.onSearchedRecipeAction,
    required this.onDisposeSearchedRecipe,
  }) : super(equals: [
          recipes,
          searchedRecipes,
        ]);

  final List<Recipe> recipes;
  final List<Recipe> searchedRecipes;
  final Function(String) onGetRecipeAction;
  final Function(String) onSearchedRecipeAction;
  final VoidCallback onDisposeSearchedRecipe;
}
