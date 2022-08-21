import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constant/api_path_constants.dart';

Dio createDio() {
  Dio dio = Dio(BaseOptions(
      baseUrl: ApiPathConstants.baseApiUrl,
      connectTimeout: 20000,
      sendTimeout: 20000,
      receiveTimeout: 20000,
      contentType: "application/json",
      responseType: ResponseType.json));

  return dio;
}
