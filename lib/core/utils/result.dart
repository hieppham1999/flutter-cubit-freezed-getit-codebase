import 'package:flutter_cubit_freezed_getit_codebase/domain/exceptions/app_exception.dart';

/// Lightweight Either/Result type. Prefer this over throwing across layers
/// when callers want to react to specific failure modes without try/catch.
sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(AppException error) = Failure<T>;

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get valueOrNull => switch (this) {
        Success<T>(:final value) => value,
        Failure<T>() => null,
      };

  AppException? get errorOrNull => switch (this) {
        Success<T>() => null,
        Failure<T>(:final error) => error,
      };

  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(AppException error) onFailure,
  }) {
    return switch (this) {
      Success<T>(:final value) => onSuccess(value),
      Failure<T>(:final error) => onFailure(error),
    };
  }

  /// Runs [action], wrapping any throw into a [Failure].
  static Future<Result<T>> guardAsync<T>(Future<T> Function() action) async {
    try {
      return Result.success(await action());
    } catch (e, st) {
      return Result.failure(AppException.from(e, st));
    }
  }

  static Result<T> guard<T>(T Function() action) {
    try {
      return Result.success(action());
    } catch (e, st) {
      return Result.failure(AppException.from(e, st));
    }
  }
}

final class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;
}

final class Failure<T> extends Result<T> {
  const Failure(this.error);
  final AppException error;
}
