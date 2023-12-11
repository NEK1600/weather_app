sealed class Result<S, E extends CustomFailure> {
  const Result();
}

class Success<S, E extends CustomFailure> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

class Failure<S, E extends CustomFailure> extends Result<S, E> {
  const Failure(this.value);
  final E value;
}

abstract interface class CustomFailure {
  String messageError();
}

class CachePersonFailure implements CustomFailure {
  final String message;
  CachePersonFailure({required this.message});
  @override
  String messageError() {
    return message;
  }
}

class ServerFailure implements CustomFailure {
  final String message;
  ServerFailure({required this.message});
  @override
  String messageError() {
    return message;
  }
}

class LocationFailure implements CustomFailure {
  final String message;
  LocationFailure({required this.message});
  @override
  String messageError() {
    return message;
  }
}
