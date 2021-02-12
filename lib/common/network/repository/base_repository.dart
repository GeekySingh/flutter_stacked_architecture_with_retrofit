import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_stacked_arch_retrofit/common/constant/constants.dart';
import 'package:flutter_stacked_arch_retrofit/common/constant/strings.dart';
import 'package:flutter_stacked_arch_retrofit/common/network/result.dart';
import 'package:logger/logger.dart';

abstract class ErrorCode {
  static const error = "Error";
  static const failed = "Failed";
  static const message = "message";
  static const unauthorized = "unauthorized";
}

abstract class BaseRepository {
  final String endpoint = AppConstants.apiEndpoint;

  final Map<String, String> _headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
  };

  final _logger = Logger();

  Dio get dio => Dio()..options.headers = _headers;

  Future<Result<T>> safeCall<T>(Future<T> call) async {
    try {
      var response = await call;
      _logger.d("Api success message -> $response");
      return Success(response);
    } catch (exception) {
      _logger.e(exception);
      if (exception is DioError) {
        switch (exception.type) {
          case DioErrorType.CONNECT_TIMEOUT:
          case DioErrorType.SEND_TIMEOUT:
          case DioErrorType.RECEIVE_TIMEOUT:
          case DioErrorType.CANCEL:
            _logger.e("Api error message -> ${AppStrings.poorNetworkError}");
            return Error(AppStrings.poorNetworkError);
            break;

          case DioErrorType.DEFAULT:
            _logger.e("Api error message -> ${AppStrings.noNetworkError}");
            return Error(AppStrings.noNetworkError);
            break;

          case DioErrorType.RESPONSE:
            return _getError(exception.response);
            break;
        }
      }
      return Error(AppStrings.genericError);
    }
  }

  Result<T> _getError<T>(Response response) {
    if (response?.data != null && response?.data is Map<String, dynamic>) {
      if ((response.data as Map<String, dynamic>)
          .containsKey(ErrorCode.message)) {
        _logger.e("Api error response -> ${response.data.toString()}");
        final errorMessage = response.data[ErrorCode.message];
        return Error(errorMessage);
      }
    }
    return Error(
      AppStrings.genericError,
    );
  }
}
