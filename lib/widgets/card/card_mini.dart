// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators, prefer_is_empty, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardMini extends StatelessWidget {
  final Icon icon;
  final String text;
  final double size;
  final double? width;
  final Color? background;
  CardMini(
      {Key? key,
      required this.icon,
      this.text = "",
      this.size = 0,
      this.width,
      this.background})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        child: Card(
          color: null != background ? background : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              Expanded(flex: 5, child: icon),
              if (text.length != 0)
                Expanded(
                  flex: 3,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: null != width ? width! * .035 : 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
            ],
          ),
        ));
  }
}
