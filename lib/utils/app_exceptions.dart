class AppException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    String msg = _message.replaceAll('\$', '\n');
    msg = msg.replaceAll('"', '');
    msg = msg.trim();
    msg = "\n$msg";
    return "$_prefix$msg";
  }
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message])
      : super(message, "Request time out: ");
}
