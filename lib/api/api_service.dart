import 'package:appfarm/utils/auth_service.dart';
import 'package:appfarm/utils/dio_common.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  static SharedPreferences? _prefs;
  LoginResponseModel? userData;

  Future<LoginResponseModel> login(String username, String password) async {
    String url =
        "http://baiwa.ddns.net:9440/backend-example/token/generate-token";

    // print(requestModel.toJson());

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );

    print(response.body);

    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401) {
      LoginResponseModel data = LoginResponseModel.fromJson(
        json.decode(response.body),
      );
      setLogin(data);
      return data;
    } else {
      throw Exception('Failed to load data!');
    }
  }

   setLogin(LoginResponseModel data) async {
    _prefs = await SharedPreferences.getInstance();

    _prefs?.setString("token", data.token);
    _prefs?.setString("username", data.username);
    _prefs?.setString("firstName", data.firstName);
    _prefs?.setString("lastName", data.lastName);
    _prefs?.setString("dateOfBirth", data.dateOfBirth);
    _prefs?.setString("mobile", data.mobile);
    _prefs?.setString("email", data.email);
    // _prefs?.setString("role", data.role);

    DioCommon()..setBearer(data.token);
    userData = data;

  }
}
