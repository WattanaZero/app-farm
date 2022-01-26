import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  // final authCon = Get.find<StmAuth>();
  // final EmployeeData data;
  SettingScreen();
  @override
  Widget build(BuildContext context) {
    return AppbarBg(
      title: 'ตั้งค่า',
      topWidget: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'ตั้งค่าทั่วไป',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Color(0xff061C4B),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                ListTile(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ProfileScreen(
                    //               dataEmployee: data,
                    //             )));
                  },
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff2B6FFB),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        FeatherIcons.user,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    'บัญชีผู้ใช้',
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Color(0xff5C6881),
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  indent: 15,
                  endIndent: 20,
                ),
                ListTile(
                  onTap: () {
                    // Get.to(LangSettingScreen());
                  },
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff2B6FFB),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.translate,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    'ภาษา',
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Color(0xff5C6881),
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
            // child: GradientBtnWg(
            //   'signOut'.tr,
            //   onTab: () {
            //     Navigator.popUntil(context, ModalRoute.withName('/'));
            //     Get.find<StmAuth>().setLogin(false, null);
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
