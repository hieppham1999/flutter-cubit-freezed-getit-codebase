/// Domain-level exception hierarchy. Repositories should map raw
/// platform/SDK errors to one of these so the presentation layer can react
/// without depending on data-layer types.
sealed class AppException implements Exception {
  const AppException({
    required this.message,
    this.code,
    this.cause,
    this.stackTrace,
  });

  final String message;
  final String? code;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => '$runtimeType($message${code != null ? ', $code' : ''})';

  /// Wraps an arbitrary error into an [AppException]. Pass-through if it's
  /// already one; otherwise becomes [UnknownException].
  static AppException from(Object error, [StackTrace? stackTrace]) {
    if (error is AppException) return error;
    return UnknownException(
      message: error.toString(),
      cause: error,
      stackTrace: stackTrace,
    );
  }
}

class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.code,
    super.cause,
    super.stackTrace,
    this.statusCode,
  });

  final int? statusCode;
}

class CacheException extends AppException {
  const CacheException({
    required super.message,
    super.code,
    super.cause,
    super.stackTrace,
  });
}

class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.code,
    super.cause,
    super.stackTrace,
  });
}

class UnknownException extends AppException {
  const UnknownException({
    required super.message,
    super.code,
    super.cause,
    super.stackTrace,
  });
}
