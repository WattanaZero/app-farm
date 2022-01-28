import 'package:appfarm/widgets/card/card_report.dart';
import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';

class WasteReport extends StatefulWidget {
  WasteReport({Key? key}) : super(key: key);

  @override
  State<WasteReport> createState() => _WasteReportState();
}

class _WasteReportState extends State<WasteReport> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return AppbarBg(
      title: 'แจ้งผักเสีย',
      topWidget: CardReport(),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'รายการเเจ้งเคลม',
                          style: TextStyle(
                              fontSize: isTablet ? percenW * 3 : 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
