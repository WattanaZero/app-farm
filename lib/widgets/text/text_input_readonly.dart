import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputReadonly extends StatelessWidget {
  final String title;
  final String text;
  final double? height;
  final EdgeInsets padding;
  TextInputReadonly({required this.title,required this.text, this.height,required this.padding});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          padding: padding,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
      Row(
        children: [
          Expanded(
            child: Container(
              height: height,
              child: Card(
                elevation: 0,
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(text),
                ),
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
