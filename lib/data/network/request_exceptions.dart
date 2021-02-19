abstract class RequestException implements Exception {
  final String message;

  const RequestException(this.message);

  factory RequestException.fromStatusCode(int statusCode, String message) {
    if (statusCode != null) {
      if (statusCode == 401) {
        return UnauthorizedException(message);
      } else if (statusCode >= 400 && statusCode < 500) {
        return ClientRequestException(message);
      } else if (statusCode >= 500) {
        return ServerRequestException(message);
      }
    }
    return UnexpectedException(message, statusCode);
  }
}

class UnauthorizedException extends RequestException {
  const UnauthorizedException(String message) : super(message);
}

class ConnectionException extends RequestException {
  const ConnectionException(String message) : super(message);
}

class ClientRequestException extends RequestException {
  const ClientRequestException(String message) : super(message);
}

class ServerRequestException extends RequestException {
  const ServerRequestException(String message) : super(message);
}

class UnexpectedException extends RequestException {
  final int statusCode;

  const UnexpectedException(String message, this.statusCode) : super(message);
}
