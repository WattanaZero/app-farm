// ignore_for_file: prefer_const_constructors

import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';
class AdminPage extends StatefulWidget {
  AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final int yearNow = (new DateTime.now().year + 543);
  int? valueYear;
  int? yearSelect;
  int? yearSelectThai;
  @override
  void initState() {
    super.initState();
    yearSelect = (new DateTime.now().year);
    yearSelectThai = (new DateTime.now().year + 543);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return AppbarBg(
      title: 'ผู้ดูเเล',
      subTitle: 'ผู้ดูเเลระบบ',
      topWidget: Column(
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 10, top: 4, bottom: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      color: Color(0xFF1F78B4),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "ประจำปีพุธศักราช",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFDFF0FF),
                      ),
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(15.0),
                        hint: Text(yearNow.toString()),
                        isExpanded: true,
                        value: yearSelectThai.toString(),
                        icon: Icon(Icons.keyboard_arrow_down),
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'Cloud'),
                        underline: Container(
                          height: 1.0,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.transparent, width: 0.0))),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            yearSelect = int.parse(newValue!) - 543;
                            yearSelectThai = int.parse(newValue);
                          });
                        },
                        items: [
                          yearNow.toString(),
                          (yearNow - 1).toString(),
                          (yearNow - 2).toString(),
                          (yearNow - 3).toString(),
                          (yearNow - 4).toString(),
                          (yearNow - 5).toString(),
                          (yearNow - 6).toString(),
                          (yearNow - 7).toString(),
                          (yearNow - 8).toString(),
                          (yearNow - 9).toString(),
                          (yearNow - 10).toString(),
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'มูลค่ารวมสินค้า',
                                          style: TextStyle(
                                              fontSize:
                                                  isTablet ? percenW * 3 : 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text('0' + ' บาท',
                                                style: TextStyle(
                                                    fontSize: isTablet
                                                        ? percenW * 3
                                                        : 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                                'อัตราเพิ่มขึ้น ' +
                                                    '0' +
                                                    ' ชิ้น',
                                                style: TextStyle(
                                                    fontSize: isTablet
                                                        ? percenW * 3
                                                        : 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green)),
                                            Text(' | ',
                                                style: TextStyle(
                                                  fontSize: isTablet
                                                      ? percenW * 3
                                                      : 15,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text('อัตราลดลง ' + '0' + ' ชิ้น',
                                                style: TextStyle(
                                                    fontSize: isTablet
                                                        ? percenW * 3
                                                        : 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text('จำนวนสินค้าทั้งหมด 0 ชิ้น',
                                                style: TextStyle(
                                                  fontSize: isTablet
                                                      ? percenW * 3
                                                      : 15,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
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
