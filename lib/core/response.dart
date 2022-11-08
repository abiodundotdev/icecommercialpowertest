import 'dart:io';
import 'package:dio/dio.dart';

import 'constants/constants.dart';
import 'exceptions.dart';

typedef Request<T> = Future<Response> Function(
    String? url, Map<String, dynamic>? data);

class AppResponse {
  factory AppResponse(
    Response _response, {
    bool shouldThrow = true,
  }) {
    final _status = Status(_response.statusCode ?? 0);
    final response = _response.data;
    if (response is List) {
      return AppResponse._(
        status: _status,
        message: "Success",
        rawData: response.toList(),
        data: {},
      );
    }
    if (response == null || (response is! Map)) {
      throw ResponseException(_response.requestOptions,
          _response.statusMessage ?? AppStrings.errorMessage);
    }

    final String status =
        response.containsKey('status') ? response['status'] : _status.status;
    final String message =
        response.containsKey('message') && response['message'] != null
            ? response['message']
            : AppStrings.errorMessage;

    if (_status.isNotOk) {
      throw ResponseException(_response.requestOptions, message);
    }

    final dynamic rawData =
        response.containsKey('data') ? response['data'] : response;

    return AppResponse._(
      status: _status,
      message: message,
      rawData: rawData,
      data: _response.data,
    );
  }

  AppResponse._(
      {required this.status,
      required this.message,
      required this.rawData,
      required this.data});

  final Status status;
  final String message;
  final dynamic rawData;
  final Map data;

  @override
  String toString() => {
        'status': status.code,
        'message': message,
        'data': data.toString()
      }.toString();
}

class Status {
  Status(this.code);

  final int code;

  String get status => isOk ? 'success' : 'error';

  bool get isOk => code >= HttpStatus.ok && code < HttpStatus.multipleChoices;

  bool get isNotOk => !isOk;

  bool get isBadRequest => code == HttpStatus.badRequest;

  bool get isNotFound => code == HttpStatus.notFound;

  bool get isNotAuthorized => code == HttpStatus.unauthorized;

  bool get isConflict => code == HttpStatus.conflict;

  bool get isForbidden => code == HttpStatus.forbidden;
}

class ErrorResponse {
  String message = "";
  int? statuscode = 0;
  final Object error;
  ErrorResponse(this.error) {
    if (error is ResponseException) {
      final err = error as ResponseException;
      message = err.message;
      statuscode = err.response?.statusCode;
      return;
    }
    if (error is NotInternetException) {
      message = "Kindly check your internet connection, and retry";
      return;
    }
    if (error is Exception) {
      final err = error as Exception;
      message = "Something went wrong";
    }
  }
}
