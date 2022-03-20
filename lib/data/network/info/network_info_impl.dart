import 'package:connectivity/connectivity.dart';
import 'package:next_app/data/network/info/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  const NetworkInfoImpl({
    required this.connectivity,
  });

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result.isConnected;
  }

  @override
  Future<bool> get isNotConnected async => !(await isConnected);

  @override
  Stream<NetworkStatus> get onStatusChange =>
      connectivity.onConnectivityChanged.map((event) => event.networkStatus);
}

extension ConnectivityResultExtensions on ConnectivityResult {
  bool get isConnected {
    switch (this) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.none:
        return false;
      default:
        throw UnsupportedError('$this is not supported');
    }
  }

  NetworkStatus get networkStatus {
    switch (this) {
      case ConnectivityResult.mobile:
        return NetworkStatus.connectedMobile;
      case ConnectivityResult.wifi:
        return NetworkStatus.connectedWifi;
      case ConnectivityResult.none:
        return NetworkStatus.disconnected;
      default:
        throw UnsupportedError('$this is not supported');
    }
  }
}
