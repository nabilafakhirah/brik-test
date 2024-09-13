import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'alice_service.dart';

class DioService {
  DioService(
      AliceService aliceService,
      ) {
    _dio = Dio(
      BaseOptions(
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        connectTimeout: const Duration(seconds: 10),
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        logPrint: printRequest,
      ),
    );

    _dio.interceptors.add(
      aliceService.dioInterceptor,
    );
  }
  late Dio _dio;

  Dio get dio => _dio;

  void printRequest(Object request) {
    debugPrint('$request');
  }
}