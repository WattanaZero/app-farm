// ignore_for_file: prefer_const_constructors

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CardReport extends StatefulWidget {
  CardReport({Key? key}) : super(key: key);

  @override
  State<CardReport> createState() => _CardReportState();
}

class _CardReportState extends State<CardReport> {
  scanQR() async {
    ScanResult barcodes = await BarcodeScanner.scan();
    var barcode = barcodes.rawContent;
    
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Expanded(
              child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 2,
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFDFF0FF),
                              ),
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              child: TextFormField(
                                readOnly: false,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: size.height / 15,
                                  width: size.width,
                                  child: TextButton.icon(
                                    label: Text('ค้นหา',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                isTablet ? percenW * 4 : 15,
                                            fontWeight: FontWeight.bold)),
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: isTablet ? percenW * 3 : 25,
                                    ),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      primary: Color(0xFF344CC7),
                                      elevation: 5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))),
            ),
            Expanded(
                child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: InkWell(
                onTap: () async {
                  // print(await openQrcode());
                  scanQR();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 100 * 6,
                    vertical: Get.height / 100 * 1,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/img/qr_repair.png',
                        width: 100,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'แสกน',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 18 : 14),
                      ),
                      Text(
                        'เพื่อแจ้งเคลม',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 18 : 14),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
