import 'dart:developer';

import 'package:addx_assignment/injection.dart';
import 'package:dio/dio.dart';

import '../utils/constants/constants.dart';

enum HttpMethod {
  get,
  post,
  patch,
  delete,
  put,
}

abstract class BaseClient {
  late Dio dio;

  dynamic _call(
    HttpMethod method,
    String endPoint, {
    Map<String, dynamic>? params,
  }) async {
    log('Call API >> $method >> url: $endPoint >> body: $params');
    final accessToken = await secureStorage.read(key: SecureStorageConstant.ACCESS_TOKEN);
    if (accessToken == null) {
      return;
    }

    dio = Dio(_buildRequestOptions(accessToken));
    Response response;
    switch (method) {
      case HttpMethod.get:
        response = await dio.get(endPoint, queryParameters: params);
        break;
      case HttpMethod.post:
        response = await dio.post(endPoint, data: params);
        break;
      case HttpMethod.put:
        response = await dio.put(endPoint, data: params);
        break;
      case HttpMethod.patch:
        response = await dio.patch(endPoint, data: params);
        break;
      case HttpMethod.delete:
        response = await dio.delete(endPoint, data: params);
        break;
      default:
        response = await dio.patch(endPoint, data: params);
    }

    log("Response data: ${response.data}");
    return response;
  }

  BaseOptions _buildRequestOptions(String accessToken) {
    return BaseOptions(
      baseUrl: apiBaseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      headers: {'Authorization': 'Bearer $accessToken'},
    );
  }

  dynamic get(String path, {Map<String, dynamic>? params}) async {
    return await _call(HttpMethod.get, path, params: params);
  }

  dynamic post(String path, {Map<String, dynamic>? params}) async {
    return await _call(HttpMethod.post, path, params: params);
  }

  dynamic put(String path, {Map<String, dynamic>? params}) async {
    return await _call(HttpMethod.put, path, params: params);
  }

  dynamic delete(String path, {Map<String, dynamic>? params}) async {
    return await _call(HttpMethod.delete, path, params: params);
  }

  dynamic patch(String path, {Map<String, dynamic>? params}) async {
    return await _call(HttpMethod.patch, path, params: params);
  }
}
