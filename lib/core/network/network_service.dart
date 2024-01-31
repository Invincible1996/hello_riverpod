/// @Author: kevin
/// @Date: 2024-01-31
/// @Description:
import 'package:dio/dio.dart';
import 'package:hello_riverpod/core/config/config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkService {
  final Dio dio;

  // 构造函数中进行一行代码的初始化
  NetworkService(this.dio) {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  setHeader() {
    dio.options.headers['token'] = 'token';
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    return await dio.get(path,
        queryParameters: queryParameters, options: options);
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? data, Options? options}) async {
    return await dio.post(path, data: data, options: options);
  }
}
