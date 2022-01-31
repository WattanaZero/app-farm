import 'dart:convert';

import 'package:appfarm/api/http_service.dart';
import 'package:appfarm/model/constants.dart';
import 'package:appfarm/model/login_model.dart';
import 'package:appfarm/model/user_profile.dart';
import 'package:appfarm/utils/auth_stm.dart';
import 'package:appfarm/widgets/text/text_input_readonly.dart';
import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  // ProfilePage({Key? key}) : super(key: key);
  final ProfileData? dataProfileData;
  ProfilePage({this.dataProfileData});
  final authSer = Get.find<StmAuth>();
  ProfileData? data;

  // String fullname;
  // String role;

  Future<bool> getList(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var username = _prefs.getString('username');
    String path = "/api/test/get-profile/" + username.toString();
    var res = await HttpService.getHttpMap(path, context);
    data = ProfileData.fromJson(res);
    // var res = await http.get(Uri.parse(path));
    // this.data = LoginResponseModel.fromJson(jsonDecode(res.body));

    // username = _prefs.getString('username');
    // firstName = _prefs.getString('firstName');
    // lastName = _prefs.getString('lastName');

    // fullName = '$firstName ' ' $lastName';

    // dateOfBirth = _prefs.getString('dateOfBirth');
    // mobile = _prefs.getString('mobile');
    // email = _prefs.getString('email');
    // print(username);
    // print(fullName);
    // print(firstName);
    // print(lastName);
    // print(dateOfBirth);
    // print(mobile);
    // print(email);
    return true;
  }

  Future<bool> getProfile(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var username = _prefs.getString('username');
    String path = "/api/test/get-profile/" + username.toString();
    var res = await HttpService.getHttpMap(path, context);
    data = ProfileData.fromJson(res);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AppbarBg(
        title: 'บัญชีของฉัน',
        topWidget: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: FutureBuilder(
                future: getProfile(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              // backgroundImage: null != dataEmployee?.data?.image64
                              //     ? Image.memory(
                              //         base64Decode(
                              //             dataEmployee.data.image64.split(',').last),
                              //         // height: 100,
                              //         // width: 100,
                              //         fit: BoxFit.cover,
                              //       ).image
                              //     : AssetImage("assets/img/icon/3543456.jpg"),
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Text(
                                    ('${data?.data?.firstName} ' ' ${data?.data?.lastName}').toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Divider(
                                    thickness: 3,
                                    color: Color(0xFF2B447D),
                                  ),
                                  Text(
                                    (data!.data?.roleCode).toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  else
                    return test();
                })),
        child: FutureBuilder(
            future: getList(context),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // TextInputReadonly(
                              //   title: 'ฝ่าย',
                              //   text:
                              //       '${data.data.firstName ?? '-'} : ${data.data.lastName ?? '-'}',
                              //   padding: EdgeInsets.only(top: 10),
                              // ),
                              TextInputReadonly(
                                title: 'อีเมล',
                                text: '${data?.data?.email ?? '-'}',
                                padding: EdgeInsets.only(top: 10),
                              ),
                              TextInputReadonly(
                                title: 'เบอร์โทร',
                                text: '${data?.data?.mobile ?? '-'}',
                                padding: EdgeInsets.only(top: 10),
                              ),
                              // TextInputReadonly(
                              //   title: 'รายละเอียดเพิ่มเติม',
                              //   text: '${data.data.remark ?? '-'}',
                              //   padding: EdgeInsets.only(top: 10),
                              //   height: 150,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              else
                return test();
            }));
  }
}
