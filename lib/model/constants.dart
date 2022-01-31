import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final spinkit = SpinKitCubeGrid(
      color: Colors.green,
      size: 50.0,
      controller: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 5000)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

const waitting = "WAITING";
const valid = "VALID";
const out_of_bound = "OUT_OF_BOUND";
const invaild = "INVALID";
const admin = "ADMIN";
