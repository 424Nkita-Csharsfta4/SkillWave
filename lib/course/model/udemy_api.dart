import 'package:dio/dio.dart';

// Общий URL для Stepik API
class StepikAPI {
  static const String baseUrl = 'https://stepik.org/api';

  /// Создание экземпляра Dio для работы с API
  static final Dio _dio = Dio();

  /// Метод для выполнения GET запроса
  static Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.get('$baseUrl/$endpoint',
          queryParameters: queryParameters);
      return response;
    } catch (error) {
      throw Exception('Failed to get data: $error');
    }
  }

  /// Метод для выполнения POST запроса
  static Future<Response> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      Response response = await _dio.post('$baseUrl/$endpoint', data: data);
      return response;
    } catch (error) {
      throw Exception('Failed to post data: $error');
    }
  }
}
