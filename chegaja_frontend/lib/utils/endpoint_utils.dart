import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://chegaja-api.herokuapp.com/',
    queryParameters: {
      'size': 100,
    },
  ),
);
