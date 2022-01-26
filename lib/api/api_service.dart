import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  static SharedPreferences? _prefs;
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

  static setLogin(LoginResponseModel data) async {
    _prefs = await SharedPreferences.getInstance();
    // DioCommon()..setBearer(token);
    _prefs?.setString("token", data.token);
    _prefs?.setString("username", data.username);
    _prefs?.setString("firstName", data.firstName);
    _prefs?.setString("lastName", data.lastName);
  }
}
