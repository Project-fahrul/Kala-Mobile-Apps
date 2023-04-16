import 'package:customer_retention/model/dao/error_response.dart';

class RestException implements Exception {
  final ErrorResponse _errorResponse;
  final int _httpStatusCode;
  RestException(this._errorResponse, this._httpStatusCode);

  ErrorResponse get errorResponse => _errorResponse;

  @override
  String toString() {
    // TODO: implement toString
    return _errorResponse.message;
  }

  int get httpStatusCode => _httpStatusCode;
}
