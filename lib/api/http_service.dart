import 'dart:developer';

import 'package:appfarm/utils/dio_common.dart';
// import 'package:asset_management_app/stm/auth_stm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HttpService {
  static HttpService? _instance;
  factory HttpService() => _instance ??= HttpService.init();
  HttpService.init();

  // static Future<ResponseData<T>> getHttp<T extends JsonModelRes>(
  //     String path, T factory(Map<String, dynamic> json)) async {
  //   var resJson = await DioCommon().dio.get(path);
  //   log("GetHttp : " + path);
  //   return ResponseData<T>.fromJson(
  //       jsonDecode(resJson.data) as Map<String, dynamic>, factory);
  // }

  // static Future<ResponseData<T>> postHttp<T extends JsonModelRes>(
  //     String path, dynamic body, T factory(Map<String, dynamic> json)) async {
  //   var resJson = await DioCommon().dio.post(path, data: body);
  //   log("PostHttp : " + path);
  //   return ResponseData<T>.fromJson(
  //       resJson.data as Map<String, dynamic>, factory);
  // }

  static Future<dynamic> postHttpMap(
      String path, dynamic body, BuildContext context) async {
    var resJson = await DioCommon().dio?.post(path, data: body);
    log("Post : " + path);
    try {
      return resJson?.data as Map<String, dynamic>;
    } catch (e) {
      var res = resJson?.data as String;
      if (res.contains("401")) {
        // Get.to(LoginScreen());
        // Get.find<StmAuth>().checkLogin();
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
      return res;
    }
  }

  static Future<dynamic> getHttpMap(String path, BuildContext context) async {
    var resJson = await DioCommon().dio?.get(path);
    log("Get : " + path);
    try {
      return resJson?.data as Map<String, dynamic>;
    } catch (e) {
      var res = resJson?.data as String;
      if (res.contains("401")) {
        // navigatorKey.currentState.popUntil((route) => false);
        // Get.find<StmAuth>().checkLogin();
        Navigator.of(context).popUntil((route) => route.isFirst);
        // Get.to(LoginScreen());
        // navigator.pushAndRemoveUntil<void>(
        //   MaterialPageRoute<void>(
        //       builder: (BuildContext context) => MainScreen()),
        //   ModalRoute.withName('/'),
        // );
      }
      return res;
    }
  }
}
