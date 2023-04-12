import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:recipe_app_flutter/features/the_meal_db_details/the_meal_db_details_connector.dart';
import 'package:recipe_app_flutter/state/action/recipe_actions.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

class TheMealDBApiDetailsVmFactory extends VmFactory<AppState, TheMealDBApiDetailsConnector> {
  @override
  Vm fromStore() => TheMealDBApiDetailsVm(
        recipeDetails: _recipeDetails,
        onUpdateRecipeNote: _onUpdateRecipeNote,
      );

  Recipe get _recipeDetails => state.recipeDetails!;

  void _onUpdateRecipeNote(String note) => dispatchSync(OnUpdateRecipeNotesAction(recipeNote: note));
}

class TheMealDBApiDetailsVm extends Vm {
  TheMealDBApiDetailsVm({
    required this.recipeDetails,
    required this.onUpdateRecipeNote,
  }) : super(equals: [recipeDetails]);

  final Recipe recipeDetails;
  final Function(String) onUpdateRecipeNote;
}
