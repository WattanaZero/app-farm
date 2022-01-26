// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:appfarm/widgets/text/text_row.dart';
import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  File? imageFile;
  String dropdownValue = 'ตรวจเเล้ว';
  final boxPadding = SizedBox(
    height: 10,
  );
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
                                    Container(
                                        child: imageFile == null
                                            ? Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    TextButton.icon(
                                                      label: Text(
                                                          'Upload image',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: isTablet
                                                                  ? percenW * 3
                                                                  : 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      icon: Icon(
                                                        Icons
                                                            .camera_alt_rounded,
                                                        color: Colors.grey,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () {
                                                        _getFromGallery();
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        primary:
                                                            Color(0xFF344CC7),
                                                        elevation: 5,
                                                      ),
                                                    ),
                                                    boxPadding,
                                                  ],
                                                ),
                                              )
                                            : Container(
                                                child: Image.file(
                                                  imageFile!,
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
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
                                              child: DropdownButton(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                hint: Text("Select Type"),
                                                isExpanded: true,
                                                value: dropdownValue,
                                                icon: Icon(
                                                    Icons.keyboard_arrow_down),
                                                // iconSize: 24,
                                                // elevation: 16,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Cloud'),
                                                underline: Container(
                                                  height: 1.0,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 0.0))),
                                                ),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    dropdownValue = newValue!;
                                                  });
                                                },
                                                items: <String>[
                                                  'ตรวจเเล้ว',
                                                  'ยังไม่ตรวจ',
                                                  'ผ่านเเล้ว',
                                                  'ผ่านตรงไหน'
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    boxPadding,
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
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
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: TextField(
                                            minLines: 10,
                                            maxLines: 20,
                                            autocorrect: false,
                                            decoration: InputDecoration(
                                              hintText: 'กรอกรายละเอียด',
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
}
