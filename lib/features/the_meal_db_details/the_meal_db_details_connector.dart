import 'package:recipe_app_flutter/features/the_meal_db_Details/the_meal_db_Details_page.dart';
import 'package:recipe_app_flutter/features/the_meal_db_details/the_meal_db_details_vm.dart';
import 'package:recipe_app_flutter/state/action/recipe_actions.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class TheMealDBApiDetailsConnector extends StatelessWidget {
  const TheMealDBApiDetailsConnector({
    required this.recipeIndex,
    Key? key,
  }) : super(key: key);

  final int recipeIndex;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TheMealDBApiDetailsVm>(
      vm: () => TheMealDBApiDetailsVmFactory(),
      onInit: (store) => store.dispatchSync(SetRecipeDetails(recipeIndex: recipeIndex)),
      onDispose: (store) => store.dispatchSync(OnDisposeRecipeDetails()),
      builder: (_, vm) => TheMealDBApiDetailsPage(recipe: vm.recipeDetails),
    );
  }
}
