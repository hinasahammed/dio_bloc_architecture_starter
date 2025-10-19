class ServerException implements Exception {
  ServerException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;
}

class NetworkException implements Exception {
  NetworkException({required this.message});

  final String message;
}

class CacheException implements Exception {
  CacheException({required this.message, required this.statusCode});

  final String message;
  final int? statusCode;
}
