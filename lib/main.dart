import 'package:recipe_app_flutter/features/the_meal_db_onboarding/the_meal_db_onboarding_page.dart';
import 'package:recipe_app_flutter/utilities/the_meal_db_api_theme.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  runApp(
    StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TheMealDBApiTheme.main(),
        home: const TheMealDBApiOnboardingPage(),
      ),
    ),
  );
}
