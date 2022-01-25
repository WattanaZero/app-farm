// ignore_for_file: prefer_const_constructors, unnecessary_new, deprecated_member_use

import 'dart:ffi';

import 'package:appfarm/component/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final heightPercent = Get.height / 100;
  @override
  Widget build(BuildContext context) {
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
                                    height: 40.0,
                                    width: size.width * 10,
                                    child: TextField(
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
                                          contentPadding: EdgeInsets.all(10.0),
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
                                    height: 40.0,
                                    width: size.width * 10,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.lock),
                                          filled: true,
                                          fillColor: Colors.blueGrey[100],
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          hintText: 'Password',
                                          contentPadding: EdgeInsets.all(10.0),
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
                                      Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Home()));
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
                            )
                            )),
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
