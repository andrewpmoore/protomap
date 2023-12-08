import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gusty/src/services/dio_connectivity_request_retry.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetry requestRetry;

  RetryOnConnectionChangeInterceptor({
    required this.requestRetry,
  });

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      try {
        Response retryResponse = await requestRetry.scheduleRequestRetry(err.requestOptions);
        return handler.resolve(retryResponse);
      } catch (e) {
        // Let any new error from the retry pass through
        return super.onError(err, handler);
      }
    }
    // Let the error pass through if it's not the error we're looking for
    //return handler.next(err);
    return super.onError(err, handler);
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other && err.error != null && err.error is SocketException;
  }
}