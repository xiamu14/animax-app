import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://animaxapi.oneeeday.work';

  DioClient._internal();

  static final _singleton = DioClient._internal();

  factory DioClient() => _singleton;

  Future<Response<dynamic>> get(String path) async {
    return await _dio.get(_baseUrl + path);
  }
}
