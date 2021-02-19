import 'package:meta/meta.dart';
import 'package:next_app/common/error/failure.dart';
import 'result.dart';

class FailureResult<S, F extends Failure> extends Result<S, F> {
  final F _value;

  FailureResult(this._value);

  @override
  R fold<R>({
    @required R Function(S) onSuccess,
    @required R Function(F) onFailure,
  }) =>
      onFailure(_value);

  @override
  bool operator ==(dynamic other) =>
      other is FailureResult && other._value == _value;

  @override
  int get hashCode => _value.hashCode;
}
