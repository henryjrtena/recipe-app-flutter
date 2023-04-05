import 'package:recipe_app_flutter/api/api_client.dart';
import 'package:recipe_app_flutter/api/handler/the_meal_db_api.dart';

class ApiService {
  static final ApiService _apiService = ApiService._internal();

  factory ApiService() => _apiService;

  ApiService._internal();

  late final ApiClient _apiClient = ApiClient();

  late final Uri _baseUri = Uri.parse(ApiClient.baseUrl);

  TheMealDBApi? _theMealDBApi;

  TheMealDBApi get theMealDBApi => _theMealDBApi ??= TheMealDBApi(apiClient: _apiClient, baseUri: _baseUri);
}
