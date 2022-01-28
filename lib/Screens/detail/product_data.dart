import 'package:appfarm/widgets/text/text_row.dart';
import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';

class ProductData extends StatefulWidget {
  ProductData({Key? key}) : super(key: key);

  @override
  State<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return AppbarBg(
      title: 'รายละเอียดสินค้า',
      topWidget: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/img/image.png',
                      width: isTablet ? 195 : 170,
                      height: isTablet ? 195 : 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          )),
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'ข้อมูลสินค้า',
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
                                  children: [
                                    TextRow(listText: [
                                      'เลขที่สินค้า',
                                      'ACN21-0035'
                                    ]),
                                    TextRow(listText: [
                                      'ชื่อสินค้า',
                                      'ผักบุ้ง/อร่อยไฟเเดง'
                                    ]),
                                    TextRow(
                                        listText: ['ประเภท', 'พืชผักสีเขียว']),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'ข้อมูลสินค้าการตรวจสินค้า',
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
                                  children: [
                                    TextRow(listText: [
                                      'เลขที่การตรวจ',
                                      'ACN21-0035'
                                    ]),
                                    TextRow(
                                        listText: ['วันกำหนด', '05/07/2021']),
                                    TextRow(listText: ['ผู้ตรวจ', 'วัฒนา']),
                                    TextRow(listText: ['เเผนก', 'QC']),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'ประวัติการเเจ้งเคลม',
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
                                )),
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
      ]),
    );
  }
}
