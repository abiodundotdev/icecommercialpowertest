import 'package:dio/dio.dart';
import 'package:icecommercialpowertest/domain/domain.dart';

class DioHttpClient extends AppHttpClient {
  final Dio dio;
  DioHttpClient(this.dio);

  @override
  Future<Response> get(String url) async {
    return await dio.get(url);
  }

  @override
  Future<Response> post(String url, Map<String, dynamic> data) async {
    return await dio.post(url, data: data);
  }

  @override
  Future<Response> delete(String url, Map<String, dynamic> data) async {
    throw UnimplementedError();
  }

  @override
  Future<Response> form(String url, FormData formData) async {
    return await dio.post(url, data: formData);
  }
}
