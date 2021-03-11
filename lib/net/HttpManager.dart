import 'package:dio/dio.dart';
import 'package:flutter_application/constant/Constant.dart';

import 'CommomHeaderInterceptor.dart';
import 'HttpLoggerInterceptor.dart';

class HttpManager {
  factory HttpManager() => _getInstance();
  static HttpManager get instance => _getInstance();
  static HttpManager _instance;
  Dio dio;

  static HttpManager _getInstance() {
    if (_instance == null) {
      _instance = new HttpManager._internal();
    }
    return _instance;
  }

  HttpManager._internal() {
    if (dio == null) {
      dio = new Dio()
        ..options = BaseOptions(
            baseUrl: Constant.ASSETS_IMG,
            connectTimeout: 5000,
            receiveTimeout: 1000 * 60 * 60 * 24,
            responseType: ResponseType.json,
            headers: {"Content-Type": "application/json"})
        ..interceptors.add(HttpLoggerInterceptor())
        ..interceptors.add(CommomHeaderInterceptor());
    }
  }
}
