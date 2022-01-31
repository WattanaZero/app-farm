// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, unused_local_variable, use_key_in_widget_constructors
import 'package:appfarm/Screens/count_number_page.dart';
import 'package:appfarm/Screens/detail/setting_profile_page.dart';
import 'package:appfarm/Screens/waste_report.dart';
import 'package:appfarm/widgets/card/card_count.dart';
import 'package:appfarm/widgets/card/card_dashboard_chart.dart';
import 'package:appfarm/widgets/card/card_mini.dart';
import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'admin.dart';
import 'list_product.dart';
import 'product_search.dart';

class HomePageScreen extends StatelessWidget {
  final heightPercent = Get.height / 100;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return AppbarBg(
      title: 'โรงเรียน',
      subTitle: 'พัฒนาชุมชนด้วยพืชผักสวนครัว',
      topWidget: CardCount(
        cardTitle: 'รายการผัก',
        titleItemOne: 'ผักสด',
        titleItemTwo: 'ผักเสีย',
        titleItemThree: 'รายการทั้งหมด',
      ),
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text(
            'รายการสรุปข้อมูลเบื้องต้น',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: isTablet ? percenW * 2.5 : 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            height: 180,
            child: CardDashboard(
              axis: Axis.horizontal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'เมนู',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: isTablet ? percenW * 2.5 : 16),
          ),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.spaceEvenly,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    left: isTablet ? 50 : 0, bottom: isTablet ? 20 : 0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => CountNumberPage(),
                    //     )).then((value) {});

                    pushNewScreen(
                      context,
                      screen: CountNumberPage(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: CardMini(
                      background: Colors.white,
                      icon: Icon(
                        Icons.check_box_outlined,
                        color: Color(0xff08AA2D),
                        size: size.width * .12,
                      ),
                      size: isTablet ? size.width * .25 : size.width * .30,
                      width: size.width,
                      text: 'ตรวจนับ'),
                )),
            Padding(
                padding: EdgeInsets.only(
                    left: isTablet ? 50 : 0, bottom: isTablet ? 20 : 0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ProductSearch(),
                    //     )).then((value) {});

                    pushNewScreen(
                      context,
                      screen: ProductSearch(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: CardMini(
                      background: Colors.white,
                      icon: Icon(
                        Icons.search,
                        color: Color(0xff007D82),
                        size: size.width * .12,
                      ),
                      size: isTablet ? size.width * .25 : size.width * .30,
                      width: size.width,
                      text: 'ค้นหารรายการผัก'),
                )),
            Padding(
              padding: EdgeInsets.only(
                  left: isTablet ? 50 : 0, bottom: isTablet ? 20 : 0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => WasteReport(),
                  //     )).then((value) {});

                  pushNewScreen(
                    context,
                    screen: WasteReport(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: CardMini(
                    background: Colors.white,
                    icon: Icon(
                      Icons.warning_amber_rounded,
                      color: Color(0xffCF0E0E),
                      size: size.width * .12,
                    ),
                    size: isTablet ? size.width * .25 : size.width * .30,
                    width: size.width,
                    text: 'เเจ้งผักเสีย'),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: isTablet ? 50 : 0, bottom: isTablet ? 20 : 0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ListProduct(),
                    //     )).then((value) {});

                    pushNewScreen(
                      context,
                      screen: ListProduct(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: CardMini(
                      background: Colors.white,
                      icon: Icon(
                        Icons.list_rounded,
                        color: Color(0xffBC4009),
                        size: size.width * .12,
                      ),
                      size: isTablet ? size.width * .25 : size.width * .30,
                      width: size.width,
                      text: 'รายการตรวจสินค้า'),
                )),
            Padding(
                padding: EdgeInsets.only(
                    left: isTablet ? 50 : 0, bottom: isTablet ? 20 : 0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ListProduct(),
                    //     )).then((value) {});

                    pushNewScreen(
                      context,
                      screen: ProfilePage(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: CardMini(
                      background: Colors.white,
                      icon: Icon(
                        Icons.person,
                        color: Color(0xff003982),
                        size: size.width * .12,
                      ),
                      size: isTablet ? size.width * .25 : size.width * .30,
                      width: size.width,
                      text: 'บัญชีของฉัน'),
                )),
            Padding(
                padding: EdgeInsets.only(
                    left: isTablet ? 50 : 0, bottom: isTablet ? 20 : 0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => AdminPage(),
                    //     )).then((value) {});

                    pushNewScreen(
                      context,
                      screen: AdminPage(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: CardMini(
                      background: Colors.white,
                      icon: Icon(
                        Icons.admin_panel_settings,
                        color: Color(0xff404040),
                        size: size.width * .12,
                      ),
                      size: isTablet ? size.width * .25 : size.width * .30,
                      width: size.width,
                      text: 'บัญชีผู้ดูเเล'),
                ))
          ],
        ),
        SizedBox(
          height: 50,
        )
      ]),
    );
  }
}
