import 'package:dio/dio.dart';

class CommomHeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    options.headers['Authorization'] = '123';
    options.headers['content-type'] = '2';
    return super.onRequest(options);
  }
}
