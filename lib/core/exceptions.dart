import 'package:dio/dio.dart';
import 'constants/app_strings.dart';

class DioException extends DioError {
  DioException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);
}

class _BaseException implements Exception {
  final String? message;
  _BaseException(this.message);
  @override
  String toString() =>
      message == null ? "$runtimeType" : "$runtimeType($message)";
}

class ValidatorException extends _BaseException {
  ValidatorException(String message) : super(message);
}

class NotInternetException extends ResponseException {
  NotInternetException(RequestOptions requestOptions, [String? message])
      : super(requestOptions, message);
}

class NotFoundException extends ResponseException {
  NotFoundException(RequestOptions requestOptions, [String? message])
      : super(requestOptions, message);
}

class RedirectException extends ResponseException {
  RedirectException(RequestOptions requestOptions, [String? message])
      : super(requestOptions, message);
}

class ForbiddenException extends ResponseException {
  ForbiddenException(RequestOptions requestOptions, [String? message])
      : super(requestOptions, message);
}

class TimeOutException extends ResponseException {
  TimeOutException(RequestOptions requestOptions, [String? message])
      : super(requestOptions, AppStrings.timeOutError);
}

class BadRequestException extends ResponseException {
  BadRequestException(RequestOptions requestOptions, [String? message])
      : super(requestOptions, message);
}

class DeviceException extends ResponseException {
  DeviceException(RequestOptions requestOptions, [String? message])
      : super(requestOptions, message);
}

class UnAuthorisedException extends ResponseException {
  UnAuthorisedException(RequestOptions requestOptions, [String? message])
      : super(requestOptions, message);
}

class ResponseException extends DioError {
  ResponseException(RequestOptions requestOptions, this._message)
      : super(requestOptions: requestOptions);

  final String? _message;

  @override
  String get message => _message ?? "";
}

abstract class DioSubClassEception extends DioError {
  DioSubClassEception({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);
}
