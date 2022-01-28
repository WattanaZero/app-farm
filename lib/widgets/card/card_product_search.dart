// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'card_mini.dart';

class CardSearchProduct extends StatefulWidget {
  CardSearchProduct({Key? key}) : super(key: key);

  @override
  State<CardSearchProduct> createState() => _CardSearchProductState();
}

class _CardSearchProductState extends State<CardSearchProduct> {
  String dropdownValue1 = 'ตรวจเเล้ว';
  String dropdownValue2 = 'ตรวจเเล้ว';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return Container(
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFDFF0FF),
                        ),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          hint: Text(""),
                          isExpanded: true,
                          value: dropdownValue1,
                          icon: Icon(Icons.keyboard_arrow_down),
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 1.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.transparent,
                                        width: 0.0))),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue1 = newValue!;
                            });
                          },
                          items: <String>[
                            'ตรวจเเล้ว',
                            'ยังไม่ตรวจ',
                            'ผ่านเเล้ว',
                            'ผ่านตรงไหน'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFDFF0FF),
                        ),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          hint: Text(""),
                          isExpanded: true,
                          value: dropdownValue2,
                          icon: Icon(Icons.keyboard_arrow_down),
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 1.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.transparent,
                                        width: 0.0))),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          },
                          items: <String>[
                            'ตรวจเเล้ว',
                            'ยังไม่ตรวจ',
                            'ผ่านเเล้ว',
                            'ผ่านตรงไหน'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
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
                                            contentPadding:
                                                EdgeInsets.fromLTRB(5, 0, 0, 0),
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
            )));
  }
}
