import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app_flutter/api/model/ingredient.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    @JsonKey(name: 'strMeal') required String strMeal,
    @JsonKey(name: 'strCategory') required String strCategory,
    @JsonKey(name: 'strInstructions') required String strInstructions,
    @JsonKey(name: 'strMealThumb') required String strMealThumb,
    @JsonKey(name: 'ingredients') @Default(<Ingredient>[]) List<Ingredient> ingredients,
    @JsonKey(ignore: true) @Default(emptyString) String note,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
