import 'package:appfarm/model/login_model.dart';
import 'package:appfarm/utils/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:developer';

class StmAuth extends GetxController {
  RxString isLogin = 'init'.obs;
  LoginResponseModel? userData;

  // setLang() async {
  // final lang = await LocalStorageService.getLang();
  // SharedPreferences _prefs;
  // _prefs = await SharedPreferences.getInstance();
  // String lang = _prefs.getString(KeySharedPreConstant.lang);
  // String region = _prefs.getString(KeySharedPreConstant.region);
  // if (lang != null) {
  //   Get.updateLocale(Locale(lang, region));
  //   LocalStorageService.setLang(Locale(lang, region));
  // } else {
  //   Get.updateLocale(Locale('th', 'TH'));
  // }
  // }

  checkLogin() async {
    String? token = await AuthenService.getLogin();
    if (token == null || token == '') {
      isLogin.value = 'isNotLogIn';
    } else {
      userData =
          await AuthenService.getDataAuthen("/token/generate-token", token);

      //**  เอาไว้เช็คโทเค็นหมดอายุ */
      // if (userData == null) {
      //   await AuthenService.removeLogin();
      //   isLogin.value = 'isNotLogIn';
      //   return;
      // }
      userData?.token = token;
      isLogin.value = 'isLogIn';
      // await Get.find<EmployeeStm>().getList();
    }
  }

  setLogin(bool isLogin, LoginResponseModel data) async {
    await AuthenService.removeLogin();
    if (isLogin) {
      userData = data;
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      await AuthenService.setLogin(data.token);
      this.isLogin.value = 'isLogIn';
    } else {
      userData = null;
      this.isLogin.value = 'isNotLogIn';
    }
    update();
  }

  @override
  void onInit() {
    checkLogin();
    // setLang();
    super.onInit();
  }
}
