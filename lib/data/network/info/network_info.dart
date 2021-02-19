abstract class NetworkInfo {
  const NetworkInfo();

  Future<bool> get isConnected;

  Future<bool> get isNotConnected;

  Stream<NetworkStatus> get onStatusChange;
}

enum NetworkStatus {
  connectedWifi,
  connectedMobile,
  disconnected,
}
