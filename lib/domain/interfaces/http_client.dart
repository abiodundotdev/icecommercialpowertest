import 'package:dio/dio.dart';

abstract class AppHttpClient<R> {
  Future<R> get(String url);
  Future<R> post(String url, Map<String, dynamic> data);
  Future<R> delete(String url, Map<String, dynamic> data);
  Future<R> form(String url, FormData formData);
}
