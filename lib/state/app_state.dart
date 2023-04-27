import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app_flutter/api/model/recipe.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(<Recipe>[]) List<Recipe> recipes,
    @Default(<Recipe>[]) List<Recipe> searchedRecipes,
    @Default(null) Recipe? recipeDetails,

    // ignored by state
    @Default(Wait.empty) @JsonKey(ignore: true) Wait wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
