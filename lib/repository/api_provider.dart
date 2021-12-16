// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:crypto_deeprooted/repository/api_constants.dart';
import 'package:crypto_deeprooted/repository/api_interceptor.dart';
import 'package:crypto_deeprooted/widgets/app_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiProvider {
  Dio? dio;
  ApiProvider() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 10000, connectTimeout: 5000);
    dio = Dio(options);
    dio!.interceptors.add(LoggingInterceptor(this.dio));
  }

  var _baseUrl = APIConstants.baseURLs;

  Future<dynamic> get(String url) async {
    // ignore: avoid_print
    print('Api Get, url $url');

    var responseJson;
    try {
      final response = await dio!.get(
        _baseUrl + url,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      AppToast.show("No Internet Available", Colors.red);
      throw Exception('No Internet connection');
    } catch (e) {
      throw e;
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body,
      {Map<String, String>? headers}) async {
    print('Api Post, url $url');
    print('body $body');
    var responseJson;

    try {
      // ignore: prefer_conditional_assignment
      if (headers == null) {
        headers = {
          "Content-Type": "application/json",
        };
      }
      final response = await dio!
          .post(_baseUrl + url, data: body, options: Options(headers: headers));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      AppToast.show("No Internet Available", Colors.red);
      throw Exception('No Internet connection');
    } catch (e) {
      rethrow;
    }
    print('api post.');
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw Exception(response.toString());
      case 401:
        throw Exception(response.toString());
      case 403:
        throw Exception(response..toString());
      case 500:
      default:
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
