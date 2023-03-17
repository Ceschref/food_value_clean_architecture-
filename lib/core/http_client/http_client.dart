import 'package:dio/dio.dart';
import 'package:web_provise/core/logging/intercepter_logger.dart';

class HttpClient {
  HttpClient._internal();

  static HttpClient shared = HttpClient._internal();

  Dio? _repository;

  static Dio getRepository() {
    shared._repository ??= generateRepository();
    return shared._repository!;
  }

  static Dio generateRepository() => Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 30000),
          receiveTimeout: const Duration(seconds: 30000),
          responseType: ResponseType.json,
          headers: {
            Headers.contentTypeHeader: 'application/json',
          },
        ),
      )..interceptors.add(AppInterceptorLogging());
}
