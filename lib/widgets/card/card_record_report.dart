import 'package:flutter/material.dart';

class RecordReport extends StatefulWidget {
  final Axis axis;
  RecordReport({
    Key? key,
    this.axis = Axis.vertical,
  }) : super(key: key);

  @override
  State<RecordReport> createState() => _RecordReportState();
}

class _RecordReportState extends State<RecordReport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Card(
              child: Text('103'),
            ))
          ],
        ),
      ),
    );
  }
}
