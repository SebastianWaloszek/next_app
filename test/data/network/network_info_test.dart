import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:next_app/data/network/info/network_info.dart';
import 'package:next_app/data/network/info/network_info_impl.dart';

class ConnectivityMock extends Mock implements Connectivity {}

void main() {
  NetworkInfo networkInfo;
  ConnectivityMock connectivityMock;

  setUp(() {
    connectivityMock = ConnectivityMock();
    networkInfo = NetworkInfoImpl(connectivity: connectivityMock);
  });

  test('Should return positive network status if mobile is available',
      () async {
    // Build
    when(connectivityMock.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.mobile);
    // Act
    final result = await networkInfo.isConnected;
    // Expect
    verify(connectivityMock.checkConnectivity());
    expect(result, true);
    verifyNoMoreInteractions(connectivityMock);
  });

  test('Should return positive network status if wifi is available', () async {
    // Build
    when(connectivityMock.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.wifi);
    // Act
    final result = await networkInfo.isConnected;
    // Expect
    verify(connectivityMock.checkConnectivity());
    expect(result, true);
    verifyNoMoreInteractions(connectivityMock);
  });

  test('Should return negative network status if internet is not available',
      () async {
    // Build
    when(connectivityMock.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.none);
    // Act
    final result = await networkInfo.isConnected;
    // Expect
    verify(connectivityMock.checkConnectivity());
    expect(result, false);
    verifyNoMoreInteractions(connectivityMock);
  });
}
