// ignore_for_file: prefer_const_constructors

import 'package:appfarm/widgets/card/card_product_search.dart';
import 'package:appfarm/widgets/text/text_row.dart';
import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';

import 'detail/product_data.dart';

class ProductSearch extends StatefulWidget {
  ProductSearch({Key? key}) : super(key: key);

  @override
  State<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return AppbarBg(
      title: 'ค้นหาสินค้า',
      topWidget: CardSearchProduct(),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductData(),
                    )).then((value) {});
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/img/image.png',
                          width: isTablet ? 100 : 75,
                          height: isTablet ? 100 : 75,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextRow(listText: ['ชื่อสินค้า', 'บุ้ง']),
                            TextRow(listText: ['เลขที่สินค้า', 'ACN21-0035']),
                            TextRow(listText: ['ผู้ครอบครอง', 'วัฒนา']),
                            TextRow(listText: ['เลชที่สัญญา', '123456-NC']),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
