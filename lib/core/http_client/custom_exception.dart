class CustomException implements Exception {
  CustomException([this._prefix, this._message]);

  final dynamic _message;
  final dynamic _prefix;

  @override
  String toString() {
    return '$_prefix$_message';
  }

  String getMessage() {
    return _message ?? '';
  }

  String getStatus() {
    return _prefix ?? '';
  }

  static String catchError(e) {
    if (e is CustomException) {
      return e.getMessage();
    } else {
      return e.toString();
    }
  }
}

class NoConnectionException extends CustomException {
  NoConnectionException([String? message]) : super('No internet connection: ', message);
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super('Error During Communication: ', message);
}

class BadRequestException extends CustomException {
  BadRequestException([String? message]) : super('Bad Request Exception', message);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([String? message]) : super('Unauthorised error: ', message);
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super('Invalid Input error: ', message);
}

class MappingDataException extends CustomException {
  MappingDataException([dynamic message]) : super('Mapping data from Json error: ', message);
}

class NoDataException extends CustomException {
  NoDataException([dynamic message]) : super('No data available from response: ', message);
}

class BadAccessException extends CustomException {
  BadAccessException([dynamic message]) : super('Bad access available from response: ', message);
}
