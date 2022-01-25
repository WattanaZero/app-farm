// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final List<String> listText;
  final EdgeInsetsGeometry padding;
  TextRow({
    Key? key,
    required this.listText,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isTablet = MediaQuery.of(context).size.width > 600;
    var fontSize;
    if (isTablet) {
      fontSize = 20.0;
    }
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '${listText[0]}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: fontSize),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${listText[1] == '' ? '-' : listText[1]}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Colors.black,
                    fontSize: fontSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
