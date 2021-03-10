import 'package:dio/dio.dart';

class CustomInterceptor extends InterceptorsWrapper {
  @override
  Future onResponse(Response response) {
    print("response:\n");
    print(">>>>>>>>>>>>>>>>:  ${(response.request.path)}\n");
    if (response.headers != null) {
      print("header:  ${response.headers.toString()}\n");
    }
    print("statusCode:  ${response.statusCode.toString()}\n");
    print("${response.toString()}");
    print("${(response.request.path)}");
    print('<<<<<<<<<<<<<<<<<<END');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("error:  ${err.message.toString()}");
    return super.onError(err);
  }
}
