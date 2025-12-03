import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl = "http://your-backend-api.com/api/v1"; // Placeholder for Backend API

  ApiProvider() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
    // Add interceptors for logging, authentication, etc. here
    // _dio.interceptors.add(AuthInterceptor());
  }

  // Example GET request (will be used by repositories)
  Future<Response> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response;
    } on DioException catch (e) {
      // Handle Dio errors (e.g., connection issues, 404, 500)
      throw Exception('Failed to load data: ${e.message}');
    }
  }

  // Example POST request
  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to post data: ${e.message}');
    }
  }
}
