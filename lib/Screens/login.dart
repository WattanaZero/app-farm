// ignore_for_file: prefer_const_constructors, unnecessary_new, deprecated_member_use

import 'dart:ffi';

import 'package:appfarm/api/api_service.dart';
import 'package:appfarm/component/home.dart';
import 'package:appfarm/widgets/Progress/ProgressHUD.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final heightPercent = Get.height / 100;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form != null) {
      if (form.validate()) {
        form.save();
        return true;
      }
    }
    return false;
  }

  Widget _uiSetup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/img/bg-log.png",
            fit: BoxFit.fitWidth,
            width: Get.width,
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                width: Get.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: heightPercent * 20,
                    ),
                    const Text('เกษตรชาวบ้าน',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: heightPercent * 4,
                    ),
                    SizedBox(height: heightPercent * 20),
                    ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 600),
                        child: Form(
                            key: globalFormKey,
                            child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: heightPercent * 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: Container(
                                        // height: 40.0,
                                        // width: size.width * 10,
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          onSaved: (input) => username = input!,
                                          validator: (input) =>
                                              input!.length < 1
                                                  ? "Please enter your username"
                                                  : null,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.person),
                                              filled: true,
                                              fillColor: Colors.blueGrey[100],
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              hintText: 'Username',
                                              contentPadding:
                                                  EdgeInsets.all(10.0),
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Container(
                                        alignment: Alignment.center,
                                        // height: 40.0,
                                        // width: size.width * 10,
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          onSaved: (input) => password = input!,
                                          validator: (input) =>
                                              input!.length < 1
                                                  ? "Please enter your password"
                                                  : null,
                                          obscureText: hidePassword,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    hidePassword =
                                                        !hidePassword;
                                                  });
                                                },
                                                icon: Icon(hidePassword
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                              ),
                                              filled: true,
                                              fillColor: Colors.blueGrey[100],
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              hintText: 'Password',
                                              contentPadding:
                                                  EdgeInsets.all(10.0),
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightPercent * 4,
                                    ),
                                    SizedBox(
                                      height: heightPercent * 6,
                                      child: RaisedButton(
                                        onPressed: () {
                                          if (validateAndSave()) {
                                            print(username);
                                            print(password);

                                            setState(() {
                                              isApiCallProcess = true;
                                            });

                                            APIService apiService =
                                                new APIService();
                                            apiService
                                                .login(username!, password!)
                                                .then((value) {
                                              if (value != null) {
                                                setState(() {
                                                  isApiCallProcess = false;
                                                });

                                                if (value.token.isNotEmpty) {
                                                  final snackBar = SnackBar(
                                                      content: Text(
                                                          "Login Successful"));
                                                  scaffoldKey.currentState
                                                      ?.showSnackBar(snackBar);
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Home()));
                                                } else {
                                                  // final snackBar = SnackBar(
                                                  //     content: Text(value.error));
                                                  // scaffoldKey.currentState!
                                                  //     .showSnackBar(snackBar);
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'User Not Found'),
                                                          actions: <Widget>[
                                                            FlatButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context,
                                                                          rootNavigator:
                                                                              true)
                                                                      .pop(
                                                                          'dialog');
                                                                },
                                                                child: Text(
                                                                    'close'))
                                                          ],
                                                        );
                                                      });
                                                }
                                              }
                                            });
                                          } else if (username != null &&
                                              password != null) {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content: Text('Login Fail'),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true)
                                                                .pop('dialog');
                                                          },
                                                          child: Text('close'))
                                                    ],
                                                  );
                                                });
                                          }
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             Home()));
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0)),
                                        textColor: Colors.white,
                                        padding: const EdgeInsets.all(0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 50.0,
                                          width: size.width * 0.5,
                                          decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              gradient: new LinearGradient(
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  colors: [
                                                    Color.fromARGB(
                                                        255, 53, 122, 226),
                                                    Color.fromARGB(
                                                        255, 131, 175, 240)
                                                  ])),
                                          padding: const EdgeInsets.all(0),
                                          child: Text(
                                            "LOGIN",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightPercent * 5,
                                    ),
                                  ],
                                )))),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
