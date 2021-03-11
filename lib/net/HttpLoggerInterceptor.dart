import 'package:dio/dio.dart';

class HttpLoggerInterceptor extends InterceptorsWrapper {
  get interceptors => null;

  @override
  Future onResponse(Response response) {
    print("---------Start Http Response---------");
    print("Response_BaseUrl:  ${response.request.baseUrl}");
    print("Response_Path: ${response.request.path}");
    print("Response_StatusCode: ${response.statusCode}");
    print("Response_StatusMessage:  ${response.statusMessage}");
    print("Response_Headers:  ${response.headers.toString()}");
    print("Response_Result:  ${response.data.toString()}");
    print("---------End Http Response---------");
    return super.onResponse(response);
  }

  @override
  Future onRequest(RequestOptions options) {
    print("\n ---------Start Http Request---------");
    print("Request_BaseUrl: ${options.baseUrl}");
    print("Request_Path:  ${options.path}");
    print("Request_Method:  ${options.method}");
    print("Request_Headers: ${options.headers}");
    print("Request_Data:  ${options.data}");
    print("Request_QueryParameters  :${options.queryParameters}");
    print("---------End Http Request---------");
    return super.onRequest(options);
  }
}
