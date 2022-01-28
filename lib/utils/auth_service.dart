import 'dart:convert';
import 'package:appfarm/model/json_model_res_abstract.dart';
import 'package:appfarm/model/login_model.dart';
import 'package:appfarm/utils/dio_common.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenService {
  static AuthenService _instance = AuthenService.init();
  factory AuthenService() => _instance;
  AuthenService.init();

  static SharedPreferences? _prefs;

  static Future<T?> doAuthen<T extends JsonModelRes>(
      String path, Map body, T factory(Map<String, dynamic> json)) async {
    var resJson = await DioCommon().dio?.post(path, data: jsonEncode(body));
    if (200 != resJson?.statusCode) {
      return null;
    }
    return factory(resJson?.data as Map<String, dynamic>);
  }

  static Future<LoginResponseModel?> getDataAuthen(String path, String token) async {
    var dioCommon = DioCommon()..setBearer(token);
    var resJson = await dioCommon.dio?.get(path);
    if (401 == resJson?.statusCode) {
      // SnackbarUtils.open('เกิดข้อผิดพลาด', 'Session time out.');
    }
    if (200 != resJson?.statusCode) {
      return null;
    }
    return LoginResponseModel.fromJson(resJson?.data);
  }

  static setLogin(String token) async {
    _prefs = await SharedPreferences.getInstance();
    DioCommon()..setBearer(token);
    await _prefs?.setString('token', token);
  }

  static Future<String?> getLogin() async {
    _prefs = await SharedPreferences.getInstance();

    return _prefs?.getString('token');
  }

  static removeLogin() async {
    _prefs = await SharedPreferences.getInstance();
    // return await _prefs?.remove('token');
    return await _prefs?.clear();
  }
}
