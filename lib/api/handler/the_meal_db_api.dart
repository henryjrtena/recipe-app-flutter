import 'package:recipe_app_flutter/api/api_client.dart';
import 'package:recipe_app_flutter/api/model/recipe.dart';

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

    final recipe = response.data['meals'][0] as Json;

    final List<Map<String, dynamic>> ingredientsAndMeasures = List.empty(growable: true);
    for (var x = 1; x < 20; x++) {
      final String ingredient = response.data['meals'][0]['strIngredient$x'];
      final String measure = response.data['meals'][0]['strMeasure$x'];

      if (ingredient.isEmpty) break;

      ingredientsAndMeasures.add({
        'name': ingredient,
        'measure': measure,
      });
    }

    recipe['ingredients'] = ingredientsAndMeasures;

    return Recipe.fromJson(recipe);
  }
}
