import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:next_app/data/network/http_method.dart';
import 'package:next_app/data/network/request.dart';
import 'package:next_app/data/network/request_exceptions.dart';
import 'package:next_app/data/network/service/network_service.dart';

class NetworkServiceImpl implements NetworkService {
  final Dio dio;

  const NetworkServiceImpl({
    required this.dio,
  });

  @override
  Future<dynamic> make<T>(Request<T> request) async {
    try {
      final response = await dio.request(
        request.path,
        options: Options(
          method: request.method.getMethodString(),
        ),
        queryParameters: request.queryParameters ?? {},
        data: request.body?.toMap(),
      );
      return _handleResponse<T>(request, response);
    } on DioError catch (error) {
      _handleError(error);
    }
  }

  Future<T> _handleResponse<T>(Request<T> request, Response response) async {
    final requestSucceeded = _requestSuccessful(response.statusCode!);
    if (requestSucceeded) {
      return request.createResponse(
        json.decode(response.data as String),
      );
    } else {
      throw RequestException.fromStatusCode(
        response.statusCode,
        response.statusMessage,
      );
    }
  }

  void _handleError(DioError error) {
    if (error.type == DioErrorType.connectTimeout) {
      throw ConnectionException(error.message);
    } else {
      throw RequestException.fromStatusCode(
        error.response?.statusCode,
        error.message,
      );
    }
  }

  bool _requestSuccessful(int statusCode) =>
      statusCode >= 200 && statusCode < 300;
}
