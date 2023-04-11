import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

/// An abstract class that represents a Redux action for handling loading state.
abstract class LoadingAction extends ReduxAction<AppState> {
  LoadingAction({required this.actionKey});

  final String actionKey;

  @override
  void before() => dispatchSync(WaitAction.add(actionKey));

  @override
  void after() => dispatchSync(WaitAction.remove(actionKey));
}
