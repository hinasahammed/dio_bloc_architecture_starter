import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add auth token to headers if available
    final token = _getAuthToken(); // Implement this method
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  String? _getAuthToken() {
    // Get token from secure storage or shared preferences
    // This is a placeholder implementation
    return null;
  }
}
