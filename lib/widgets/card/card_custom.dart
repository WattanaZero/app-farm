// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color backgroundColor;
  final double borderRadius;
  final double height;
  final double width;
  final double padding;

  CardCustom({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    required this.color,
    this.backgroundColor = Colors.white,
    this.borderRadius = 15,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 0),
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: child,
      ),
    );
  }
}
