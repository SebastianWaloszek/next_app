import 'package:meta/meta.dart';
import 'package:next_app/common/error/failure.dart';
import 'package:next_app/common/result/failure_result.dart';
import 'package:next_app/common/result/result.dart';
import 'package:next_app/common/result/success_result.dart';
import 'package:next_app/data/network/info/network_info.dart';
import 'package:next_app/data/network/request.dart';
import 'package:next_app/data/network/request_exceptions.dart';
import 'package:next_app/data/network/service/network_service.dart';
import 'package:next_app/data/network/service/network_service_decorator.dart';

class ManagedNetworkService extends NetworkServiceDecorator {
  final NetworkInfo networkInfo;

  const ManagedNetworkService({
    @required this.networkInfo,
    @required NetworkService networkService,
  })  : assert(networkInfo != null),
        super(networkService);

  @override
  Future<Result<T, Failure>> make<T>(Request<T> request) async {
    final deviceNotConnected = await networkInfo.isNotConnected;
    if (deviceNotConnected) {
      return FailureResult<T, NetworkFailure>(
        const NetworkFailure('Device is not connected to network'),
      );
    }
    try {
      final result = await networkService.make(request);
      return SuccessResult(result as T);
    } on ConnectionException catch (e) {
      return FailureResult<T, NetworkFailure>(NetworkFailure(e));
    } on Exception catch (e) {
      return FailureResult<T, UnexpectedFailure>(UnexpectedFailure(e));
    }
  }
}
