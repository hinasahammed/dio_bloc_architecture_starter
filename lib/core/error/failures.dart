class Failures {
  Failures({required this.message, this.statusCode});

  final String message;
  final int? statusCode;
}

class NetworkFailure extends Failures {
  NetworkFailure({required super.message});
}

class ServerFailure extends Failures {
  ServerFailure({required super.message, super.statusCode});
}

class CacheFailure extends Failures {
  CacheFailure({required super.message, super.statusCode});
}
