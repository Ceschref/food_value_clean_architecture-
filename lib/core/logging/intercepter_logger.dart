import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'logger.dart';

class AppInterceptorLogging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!kReleaseMode) {
      printOut('*** Request ***\nrequest[${options.method}] ==> ${options.uri}',
          colorCode: 36);
      if (options.method == 'POST' || options.method == 'PUT') {
        printOut('*** PARAMS ***\n${options.data}', colorCode: 34);
      }
      if (options.method == 'GET') {
        printOut('*** PARAMS ***\n${options.queryParameters}', colorCode: 36);
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!kReleaseMode) {
      printOut(
          '*** Response ***\nRESPONSE[${response.statusCode}] <=== ${response.realUri}',
          colorCode: 32);
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!kReleaseMode) {
      printOut(
          '*** Error ***\nERROR[${err.response?.data?['code'] ?? err.response?.statusCode}] <=== ${err.requestOptions.uri} WITH MESSAGE: ${err.response?.data?['message'] ?? err.message}',
          colorCode: 31);
    }
    return super.onError(err, handler);
  }
}
