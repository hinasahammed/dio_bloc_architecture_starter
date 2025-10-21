class ServerException implements Exception {
  ServerException({required this.message, this.statusCode});
  final String message;
  final int? statusCode;
  
  @override
  String toString() => 'ServerException: $message (Code: $statusCode)';
}

class NetworkException implements Exception {
  NetworkException({required this.message});
  final String message;

  @override
  String toString() => 'NetworkException: $message';
}

class CacheException implements Exception {
  CacheException({required this.message});
  final String message;

  @override
  String toString() => 'CacheException: $message';
}
