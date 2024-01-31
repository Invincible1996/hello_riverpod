import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_riverpod/core/network/network_service.dart';

final networkProvider = Provider<NetworkService>((ref) {
  final dio = Dio();
  return NetworkService(dio);
});
