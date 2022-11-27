class AppException implements Exception {

  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString(){
    return "$_prefix$_message";
  }

}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message, "Error");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super (message, "Invalid Request");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([message]) : super(message, "Unauthorised");
}

class InvalidInputException extends AppException {
  InvalidInputException([message]) : super(message, "Invalid");
}