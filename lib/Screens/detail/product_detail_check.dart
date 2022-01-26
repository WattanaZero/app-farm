// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:appfarm/widgets/text/text_row.dart';
import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductDetailCheck extends StatefulWidget {
  ProductDetailCheck({Key? key}) : super(key: key);

  @override
  State<ProductDetailCheck> createState() => _ProductDetailCheckState();
}

class _ProductDetailCheckState extends State<ProductDetailCheck> {
  File? imageFile;
  List<PickedFile> listFileImage = [];

  String dropdownValue = 'ตรวจเเล้ว';
  final boxPadding = SizedBox(
    height: 10,
  );
  _getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 720,
      maxHeight: 720,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return AppbarBg(
      title: 'รายละเอียดสินค้า',
      topWidget: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "รายละเอียดสินค้า",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontSize: isTablet ? percenW * 3 : 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextRow(listText: ['เลขที่สินค้า', 'ACN21-0035']),
                    TextRow(listText: ['ชื่อสินค้า', 'ผักบุ้ง/อร่อยไฟเเดง']),
                    TextRow(listText: ['ประเภท', 'พืชผักสีเขียว']),
                    TextRow(listText: ['สถานะ', 'ผ่านการตรวจสอบ']),
                  ],
                )
              ],
            ),
          ),
        ),
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
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 120,
                                        width: double.infinity,
                                        child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/img/bg-log.png",
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                                    Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/img/bg-log.png",
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ],
                                            ))),
                                    Text(
                                      'สถานะสินค้า',
                                      style: TextStyle(
                                          fontSize: isTablet ? percenW * 3 : 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 70,
                                      child: Scrollbar(
                                        thickness: 2,
                                        isAlwaysShown: true,
                                        child: ListView(
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xFFDFF0FF),
                                                ),
                                                padding: EdgeInsets.only(
                                                    left: 20.0, right: 20.0),
                                                child: TextFormField(
                                                  readOnly: true,
                                                  controller:
                                                      TextEditingController(
                                                          text: "ตรวจเเล้ว"),
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 20, 10),
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    boxPadding,
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Text(
                                        "รายละเอียด",
                                        style: TextStyle(
                                            fontSize:
                                                isTablet ? percenW * 3 : 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    boxPadding,
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: TextField(
                                            minLines: 10,
                                            maxLines: 20,
                                            readOnly: true,
                                            autocorrect: false,
                                            controller: TextEditingController(
                                                text:
                                                    "การทำงาน - เป็นไปได้ด้วยดี"),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xFFDFF0FF),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    boxPadding,
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
