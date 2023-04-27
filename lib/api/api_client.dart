import 'package:dio/dio.dart';

class ApiClient {
  late Dio dio;

  static const String baseUrl = "https://www.themealdb.com/api/json/v1/1/search.php?s=";

  ApiClient() {
    dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(
        QueuedInterceptorsWrapper(
          onRequest: (options, handler) => handler.next(options),
          onError: (error, handler) => handler.reject(error),
        ),
      );
  }
}
