import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app_flutter/api/model/ingredient.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    @JsonKey(name: 'idMeal') required String idMeal,
    @JsonKey(name: 'strMeal') required String strMeal,
    @JsonKey(name: 'strCategory') required String strCategory,
    @JsonKey(name: 'strArea') required String strArea,
    @JsonKey(name: 'strInstructions') required String strInstructions,
    @JsonKey(name: 'strMealThumb') required String strMealThumb,
    @JsonKey(name: 'strTags') required String? strTags,
    @JsonKey(name: 'strYoutube') required String strYoutube,
    @JsonKey(name: 'strSource') required String? strSource,
    @JsonKey(name: 'ingredients') @Default(<Ingredient>[]) List<Ingredient> ingredients,
    @JsonKey(ignore: true) @Default(emptyString) String note,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
