import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// The outcome of a operation.
///
/// An outcome can be either a [ResultSuccess] and return a [T] result
/// or a [ResultFailure] and return a [Failure] error.
@freezed
class Result<T> with _$Result<T> {
  /// Creates a success result of [T] type.
  const factory Result(T result) = _ResultSuccess<T>;

  /// Creates a failure result with [error].
  const factory Result.failure(Failure error) = _ResultFailure;
}

/// The errors returned by a [ResultFailure].
@freezed
class Failure with _$Failure {
  /// Creates a failure error with required [value] and optional [stackTrace].
  const factory Failure(
    dynamic value, [
    StackTrace? stackTrace,
  ]) = _ErrorFailure;
}
