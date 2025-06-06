class AppException implements Exception {
  final _message;
  final _prefix;
  AppException(this._message, this._prefix);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class NoInternetExecption extends AppException {
  NoInternetExecption([String? message]) : super(message, '');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
    : super(message, 'You don\'t have access to this');
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message])
    : super(message, 'Request Time Out');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}
