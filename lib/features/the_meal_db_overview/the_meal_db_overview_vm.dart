import 'package:recipe_app_flutter/features/the_meal_db_overview/the_meal_db_overview_connector.dart';
import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

class TheMealDBApiOverviewVmFactory extends VmFactory<AppState, TheMealDBApiOverviewConnector> {
  @override
  Vm fromStore() => TheMealDBApiOverviewVm(recipes: _getRecipes);

  List<Recipe> get _getRecipes => state.recipes;
}

class TheMealDBApiOverviewVm extends Vm {
  TheMealDBApiOverviewVm({
    required this.recipes,
  }) : super(equals: [recipes]);

  final List<Recipe> recipes;
}
