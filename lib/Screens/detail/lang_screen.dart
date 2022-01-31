import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LangScreen extends StatelessWidget {
  const LangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppbarBg(
      title: 'ตั้งค่าภาษา',
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    var locale = Locale('th', 'TH');
                    Get.updateLocale(locale);
                    // LocalStorageService.setLang(locale);
                  },
                  leading: SvgPicture.asset(
                    "assets/img/th.svg",
                    height: Get.width / 10,
                    width: 35,
                  ),
                  title: Text('ภาษาไทย'),
                  trailing: Radio(
                      value: Locale('th', 'TH') == Get.locale,
                      groupValue: true,
                      onChanged: (value) {
                        var locale = Locale('th', 'TH');
                        Get.updateLocale(locale);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Colors.grey,
                    height: 1,
                    indent: 15,
                    endIndent: 20,
                  ),
                ),
                ListTile(
                  onTap: () {
                    var locale = Locale('en', 'US');
                    Get.updateLocale(locale);
                    // LocalStorageService.setLang(locale);
                  },
                  leading: SvgPicture.asset(
                    "assets/img/uk.svg",
                    height: Get.width / 10,
                    width: 35,
                  ),
                  title: Text(
                    'English',
                  ),
                  trailing: Radio(
                    value: Locale('en', 'US') == Get.locale,
                    groupValue: true,
                    onChanged: (value) {
                      var locale = Locale('en', 'US');
                      Get.updateLocale(locale);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
