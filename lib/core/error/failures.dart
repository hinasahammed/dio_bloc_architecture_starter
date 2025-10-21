abstract class Failure {
  final String message;
  final int? statusCode;
  
  const Failure({required this.message, this.statusCode});
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure &&
        other.message == message &&
        other.statusCode == statusCode;
  }

  @override
  int get hashCode => message.hashCode ^ statusCode.hashCode;
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, super.statusCode});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}

class ValidationFailure extends Failure {
  ValidationFailure({required super.message});
}
