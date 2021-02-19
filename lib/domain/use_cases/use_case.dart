import 'package:next_app/common/error/failure.dart';
import '../../common/result/result.dart';

abstract class UseCase<T, P> {
  const UseCase();

  Future<Result<T, Failure>> call([P parameters]);
}
