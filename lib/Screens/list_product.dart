// ignore_for_file: prefer_const_constructors

import 'package:appfarm/widgets/card/card_mini.dart';
import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return AppbarBg(
      title: 'ตรวจนับสินค้าย้อนหลัง',
      topWidget: Container(
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xFFDFF0FF),
                                          ),
                                          padding: EdgeInsets.only(
                                              left: 20.0, right: 20.0),
                                          child: TextFormField(
                                            readOnly: false,
                                            decoration: InputDecoration(
                                              hintText:'ค้นหารายการสินค้า',
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ))),
                                  Expanded(
                                      child: SizedBox(
                                    height: size.height / 12,
                                    width: size.width,
                                    child: CardMini(
                                      background: Color(0xff0046AF),
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                        size: isTablet ? percenW * 3 : 25,
                                      ),
                                      size: isTablet
                                          ? size.width * .08
                                          : size.width * .16,
                                      width: size.width,
                                    ),
                                  ))
                                ],
                              )))
                    ],
                  ),
                ),
              ))),
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
