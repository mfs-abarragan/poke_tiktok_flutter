import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'app_constants.dart';

class DioService extends GetxController {
  static final Dio dio = Dio();

  static DioService _singletonHttp = DioService._internal();
  late Dio _http;

  factory DioService() {
    _singletonHttp = DioService._internal();
    return _singletonHttp;
  }

  DioService._internal() {
    init();
  }

  init() {
    _http = Dio();

    _http.options.baseUrl = AppConstants.apiUrl;

    _http.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final path = options.path;
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          log(e.message);
          return handler.resolve(e.response!);
        },
      ),
    );
  }

  Dio get client => _http;
}
