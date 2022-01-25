// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_null_comparison

import 'package:appfarm/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class AppbarBg extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget child;
  final Widget topWidget;
  final bool isImg;
  const AppbarBg({
    Key? key,
    this.title = '',
    this.subTitle = '',
    required this.topWidget,
    this.isImg = true,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/img/Appbar.png",
            fit: BoxFit.fitWidth,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: ListTile(
                  title: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtils.getByDevice(20, 30, 30, 32),
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              blurRadius: 1,
                              offset: Offset(1, 1),
                              color: Colors.white),
                        ]),
                  ),
                  subtitle: Text(
                    subTitle,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtils.getByDevice(12, 20, 16, 18),
                        fontWeight: FontWeight.w500,
                        shadows: [
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(1, 1),
                              color: Colors.white),
                        ]),
                  ),
                  trailing: CircleAvatar(
                    radius: 22.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                        "assets/img/harvest.png"), // no matter how big it is, it won't overflow
                  ),
                ),
              ),
              topWidget != null
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: ScreenUtils.getByDevice(16, 20, 18, 20),
                      ),
                      child: topWidget,
                    )
                  : Container(),
              Expanded(
                child: child,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
