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

    return await apiClient.dio.getUri(uri).then((response) {
      return response.data['meals'].map<Recipe>((dynamic data) => Recipe.fromJson(data as Json)).toList().first;
    });
  }
}
