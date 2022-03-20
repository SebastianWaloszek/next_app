import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:next_app/common/environment/environment.dart';
import 'package:next_app/common/environment/environment_dev.dart';
import 'package:next_app/common/error/failure.dart';
import 'package:next_app/common/result/failure_result.dart';
import 'package:next_app/common/result/success_result.dart';
import 'package:next_app/data/network/info/network_info.dart';
import 'package:next_app/data/network/request.dart';
import 'package:next_app/data/network/request_exceptions.dart';
import 'package:next_app/data/network/service/managed_network_service.dart';
import 'package:next_app/data/network/service/network_service_impl.dart';

class NetworkInfoMock extends Mock implements NetworkInfo {}

class DioMock extends Mock implements Dio {}

class RequestMock extends Request<String> {
  const RequestMock() : super(path: 'path');
  @override
  String createResponse(dynamic json) => 'response';
}

abstract class Callable {
  void call() {}
}

class MockFunction extends Mock implements Callable {}

void main() {
  Environment.setCurrent(DevelopmentEnvironment());

  late NetworkInfo networkInfo;
  late Dio dio;

  NetworkServiceImpl networkServiceImpl;
  late ManagedNetworkService managedNetworkService;

  late RequestMock request;
  late Response response;

  setUp(() {
    dio = DioMock();
    networkInfo = NetworkInfoMock();
    networkServiceImpl = NetworkServiceImpl(
      dio: dio,
    );
    managedNetworkService = ManagedNetworkService(
      networkInfo: networkInfo,
      networkService: networkServiceImpl,
    );
    request = const RequestMock();
    response = Response(
      data: jsonEncode({}),
      requestOptions: RequestOptions(path: 'path'),
      statusCode: 200,
    );
    when(() => networkInfo.isNotConnected).thenAnswer((_) async => false);
  });

  test('Should return SuccessResult when request succeeds', () async {
    // Build
    when(
      () => dio.request(
        any(),
        options: any(named: 'options'),
        queryParameters: any(named: 'queryParameters'),
        data: any(named: 'data'),
      ),
    ).thenAnswer((_) async => response);
    // Act
    final result = await managedNetworkService.make(request);
    // Expect
    expect(result is SuccessResult, isTrue);
  });

  test('Should return a failure result with NetworkFailure', () async {
    // Build
    when(
      () => dio.request(
        any(),
        options: any(named: 'options'),
        queryParameters: any(named: 'queryParameters'),
        data: any(named: 'data'),
      ),
    ).thenThrow(const ConnectionException(''));
    // Act
    final result = await managedNetworkService.make(request);
    // Expect
    expect(result is FailureResult, isTrue);
    result.fold(
      onFailure: (failure) => expect(failure is NetworkFailure, isTrue),
      onSuccess: (_) => {},
    );
  });

  test(
      'Should return a failure result with NetworkFailure on network not connected',
      () async {
    // Build
    when(() => networkInfo.isNotConnected).thenAnswer((_) async => true);
    // Act
    final result = await managedNetworkService.make(request);
    // Expect
    expect(result is FailureResult, isTrue);
    result.fold(
      onFailure: (failure) => expect(failure is NetworkFailure, isTrue),
      onSuccess: (_) => {},
    );
  });

  test('Should return a failure result with UnexpectedFailure on Exception',
      () async {
    // Build
    when(
      () => dio.request(
        any(),
        options: any(named: 'options'),
        queryParameters: any(named: 'queryParameters'),
        data: any(named: 'data'),
      ),
    ).thenThrow(Exception());
    // Act
    final result = await managedNetworkService.make(request);
    // Expect
    expect(result is FailureResult, isTrue);
    result.fold(
      onFailure: (failure) => expect(failure is UnexpectedFailure, isTrue),
      onSuccess: (_) => {},
    );
  });
}
