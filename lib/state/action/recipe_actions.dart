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
