import 'package:recipe_app_flutter/api/api_client.dart';
import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:recipe_app_flutter/utilities/constant.dart';

typedef Json = Map<String, dynamic>;

class TheMealDBApi {
  TheMealDBApi({
    required this.apiClient,
    required this.baseUri,
  });

  final ApiClient apiClient;
  final Uri baseUri;

  Future<Recipe> getRecipe({
    required String mealName,
  }) async {
    final queryParameters = <String, dynamic>{};

    queryParameters['s'] = mealName;

    final uri = baseUri.replace(queryParameters: queryParameters, path: baseUri.path);

    final response = await apiClient.dio.getUri(uri);

    final recipe = response.data[mealsLabel][mealsIndex] as Json;

    final List<Map<String, dynamic>> ingredientsAndMeasures = List.empty(growable: true);

    for (var x = minNumberOfIngredients; x < maxNumberOfIngredients; x++) {
      final String ingredient = response.data[mealsLabel][mealsIndex]['$ingredientsLabel$x'];
      final String measure = response.data[mealsLabel][mealsIndex]['$measureLabel$x'];

      if (ingredient.isEmpty) break;

      ingredientsAndMeasures.add({
        nameKey: ingredient,
        measureKey: measure,
      });
    }

    recipe[ingredientsText] = ingredientsAndMeasures;

    return Recipe.fromJson(recipe);
  }
}
