import 'dart:io';

import 'package:dio/dio.dart';

class HttpRequestError implements Exception {}

class HttpError implements Exception {}

class MyShopifyApi {
  MyShopifyApi({Dio? dio})
      : _dio = (dio ?? Dio())
          ..options.baseUrl = 'https://shopicruit.myshopify.com/';

  final Dio _dio;

  final accessToken = 'c32313df0d0ef512ca64d5b336a0d7c6';

  Future<List<dynamic>> getProducts() async {
    try {
      final response = await _dio.get(
        ('admin/products.json?access_token=$accessToken'),
      );
      if (response.statusCode != HttpStatus.ok) {
        throw HttpRequestError();
      }
      return response.data['products'] as List<dynamic>;
    } on DioError {
      throw HttpError();
    } on SocketException {
      throw HttpError();
    }
  }
}
