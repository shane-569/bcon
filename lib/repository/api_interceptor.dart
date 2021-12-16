// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:crypto_deeprooted/widgets/app_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptor extends Interceptor {
  // ignore: prefer_final_fields
  int _maxCharactersPerLine = 200;

  // ignore: prefer_final_fields
  Dio? _dio;

  LoggingInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("--> ${options.method} ${options.path}");
    print("${options.headers}");
    print("Content type: ${options.contentType}");
    print("<-- END HTTP");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("<-- ${response.statusCode} ${response.data} ");
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      print(response.data);
    }
    print("<-- END HTTP");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print("error status" + err.toString());

    if (err is DioError) {
      if (err.error is SocketException) {
        AppToast.show("No Internet Found ", Colors.red);
        super.onError(err, handler);
      }
    }
    if (err.response != null) {
      int responseCode = err.response!.statusCode!;
      print("<-- Error -->");
      print(err.error);
      print(err.message);
      print(err.response);
      // old code down
      // super.onError(err, handler);

    } else {
      super.onError(err, handler);
    }
  }
}
