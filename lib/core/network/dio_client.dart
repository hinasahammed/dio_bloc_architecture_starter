import 'package:dio/dio.dart';
import 'package:dio_bloc_architecture_starter/core/constants/api_constants.dart';
import 'package:dio_bloc_architecture_starter/core/network/interceptors/auth_interceptor.dart';
import 'package:dio_bloc_architecture_starter/core/network/interceptors/error_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static Dio? _dio;

  static Dio get instance {
    _dio ??= _createDio();
    return _dio!;
  }

  static Dio _createDio() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: Duration(milliseconds: ApiConstants.connectionTimeout),
      receiveTimeout: Duration(milliseconds: ApiConstants.recieveTimeout),
      sendTimeout: Duration(milliseconds: ApiConstants.sentTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    dio.interceptors.addAll([
      // Pretty logger for debugging (only in debug mode)
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),

      ErrorInterceptor(),

      AuthInterceptor(),
    ]);
    return dio;
  }
}
