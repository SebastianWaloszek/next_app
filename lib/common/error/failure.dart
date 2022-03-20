import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final dynamic error;

  const Failure(this.error);

  @override
  List<Object?> get props => [error];
}

class NetworkFailure extends Failure {
  const NetworkFailure(error) : super(error);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(error) : super(error);
}
