import 'dart:async';

import 'package:dio/dio.dart';

import 'custom_exception.dart';
import 'http_client.dart';

abstract class ApiProviderRepository {
  Future<Response<T>> getRequest<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> postRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> uploadFile<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> putRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> deleteRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool ignoreInvalidToken = false,
  });

  Future<Response<dynamic>> download<T>(
    String path,
    String savePath, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Function(int, int)? onReceiveProgress,
  });
}

class ApiProviderRepositoryImpl implements ApiProviderRepository {
  ApiProviderRepositoryImpl() {
    _dio = HttpClient.getRepository();
  }
  late final Dio _dio;

  @override
  Future<Response<T>> getRequest<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onReceiveProgress,
    bool ignoreInvalidToken = false,
  }) async {
    try {
      final Response<T> response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      return _catchException(e);
    }
  }

  @override
  Future<Response<T>> postRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
    bool ignoreInvalidToken = false,
  }) async {
    try {
      final Response<T> response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

      return response;
    } on DioException catch (e) {
      return _catchException(e);
    }
  }

  @override
  Future<Response<T>> deleteRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool ignoreInvalidToken = false,
  }) async {
    try {
      final Response<T> response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      return _catchException(e);
    }
  }

  @override
  Future<Response<T>> putRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
    bool ignoreInvalidToken = false,
  }) async {
    try {
      final Response<T> response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      return _catchException(e);
    }
  }

  @override
  Future<Response<T>> uploadFile<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  }) async {
    try {
      final Response<T> response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      return _catchException(e);
    }
  }

  Response<T> _catchException<T>(DioException dioError) {
    throw CustomException(dioError.response?.statusCode, dioError.response?.statusMessage);
  }

  @override
  Future<Response<dynamic>> download<T>(
    String path,
    String savePath, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final Response<dynamic> response = await _dio.download(
        path,
        savePath,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      return _catchException(e);
    }
  }
}
