

import 'package:dio/dio.dart';
import 'package:examen_flutter/shared/exceptions/error_interceptor.dart';
import 'package:examen_flutter/shared/network/loading_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioNetworkProvider = Provider.family<Dio, bool?>((ref, loading) {
  final container = ProviderContainer();
  return _provideDio(
    container,
    baseUrl: 'https://11e2-2806-106e-23-5910-9d9a-eb55-94f3-68c.ngrok-free.app/api/',
    loading: loading ?? false,
    token: '',
  );
});

Dio _provideDio(ProviderContainer container, {required String baseUrl, String token = '', bool loading = false}) {
  var dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    contentType: 'application/json; charset=UTF-8',
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'ngrok-skip-browser-warning': 'true'
    },
    receiveDataWhenStatusError: true,
    validateStatus: (_) => true,
  ));

  if (loading) {
    dio.interceptors.addAll({
      LoadingInterceptor(),
    });
  }

  dio.interceptors.addAll({
    ErrorInterceptors(dio),
  });

  return dio;
}