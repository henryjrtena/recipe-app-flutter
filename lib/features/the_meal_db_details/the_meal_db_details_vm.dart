import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:recipe_app_flutter/features/the_meal_db_details/the_meal_db_details_connector.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

class TheMealDBApiDetailsVmFactory extends VmFactory<AppState, TheMealDBApiDetailsConnector> {
  @override
  Vm fromStore() => TheMealDBApiDetailsVm(recipeDetails: _recipeDetails);

  Recipe get _recipeDetails => state.recipeDetails!;
}

class TheMealDBApiDetailsVm extends Vm {
  TheMealDBApiDetailsVm({required this.recipeDetails}) : super(equals: [recipeDetails]);

  final Recipe recipeDetails;
}
