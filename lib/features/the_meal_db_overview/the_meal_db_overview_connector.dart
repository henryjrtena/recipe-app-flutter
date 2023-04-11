import 'package:recipe_app_flutter/features/the_meal_db_overview/the_meal_db_overview_page.dart';
import 'package:recipe_app_flutter/features/the_meal_db_overview/the_meal_db_overview_vm.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class TheMealDBApiOverviewConnector extends StatelessWidget {
  const TheMealDBApiOverviewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TheMealDBApiOverviewVm>(
      vm: () => TheMealDBApiOverviewVmFactory(),
      builder: (_, vm) => TheMealDBApiOverviewPage(
        recipes: vm.recipes,
        onGetRecipe: vm.onGetRecipeAction,
      ),
    );
  }
}
