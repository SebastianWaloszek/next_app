import 'package:equatable/equatable.dart';
import 'package:next_app/data/network/http_method.dart';

abstract class Request<T> extends Equatable {
  final String path;
  final HttpMethod method;
  final RequestBody? body;
  final Map<String, dynamic>? queryParameters;

  T createResponse(dynamic json);

  const Request({
    required this.path,
    this.method = HttpMethod.get,
    this.body,
    this.queryParameters,
  });

  @override
  List<Object?> get props => [
        path,
        method,
        body,
        queryParameters,
      ];
}

abstract class RequestBody {
  Map<String, dynamic> toMap();
}
