import 'dart:developer';

import 'package:dio/dio.dart';


class DioCommon {
  static final DioCommon _instance = DioCommon.create().._init();
  factory DioCommon() => _instance;

  DioCommon.create();

  Dio? _dio;
  Dio? get dio => _dio;

  void _init() {
    _dio = Dio();
    dio?.options.baseUrl = 'http://baiwa.ddns.net:9440/backend-example';
  }

  setBearer(String token) {
    dio?.options.validateStatus = (status) => true;
    dio?.options.headers["authorization"] = "Bearer $token";
  }
}
