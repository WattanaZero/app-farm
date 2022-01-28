import 'package:appfarm/api/http_service.dart';
import 'package:appfarm/api/routes_app.dart';
import 'package:appfarm/component/home.dart';
import 'package:appfarm/model/constants.dart';
import 'package:appfarm/utils/auth_stm.dart';
import 'package:flutter/material.dart';
import 'package:appfarm/Screens/login.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routeApp,
      theme: ThemeData(
        primaryColor: Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.grey[60],
        fontFamily: 'Cloud',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: LoginScreen(),
    );
  }
}

class CkeckLoginScreen extends StatelessWidget {
  final authCon = Get.put(StmAuth());
  // final employee = Get.put(EmployeeStm());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authCon.isLogin.value == 'isLogIn') {
        return Home();
      } else if (authCon.isLogin.value == 'isNotLogIn') {
        return LoginScreen();
      }
      return Scaffold(body: spinkit);
    });
  }
}
