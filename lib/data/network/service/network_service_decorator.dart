import 'package:next_app/data/network/request.dart';
import 'package:next_app/data/network/service/network_service.dart';

abstract class NetworkServiceDecorator implements NetworkService {
  final NetworkService networkService;

  const NetworkServiceDecorator(this.networkService);

  @override
  Future make<T>(Request<T> request) {
    return networkService.make<T>(request);
  }
}
