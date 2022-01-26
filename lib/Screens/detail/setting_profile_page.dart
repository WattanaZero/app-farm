import 'package:appfarm/model/constants.dart';
import 'package:appfarm/model/login_model.dart';
import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  // const ProfilePage({Key? key}) : super(key: key);
  LoginResponseModel? data;

  String? username;
  String fullName = '';
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? mobile;
  String? email;

  Future<bool> getList(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    username = _prefs.getString('username');
    firstName = _prefs.getString('firstName');
    lastName = _prefs.getString('lastName');

    fullName = '$firstName ' ' $lastName';

    dateOfBirth = _prefs.getString('dateOfBirth');
    mobile = _prefs.getString('mobile');
    email = _prefs.getString('email');
    print(username);
    print(fullName);
    print(firstName);
    print(lastName);
    print(dateOfBirth);
    print(mobile);
    print(email);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AppbarBg(
        title: 'บัญชีของฉัน',
        topWidget: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Card(
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
                          'นาย Wattana Zero',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Divider(
                          thickness: 3,
                          color: Color(0xFF2B447D),
                        ),
                        Text(
                          'ADMIN',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'เบอร์โทรศัพท์',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 0,
                                color: Colors.grey[200],
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text('099-999999'),
                                ),
                              ),
                            ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'อีเมล',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 0,
                                color: Colors.grey[200],
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text('admin@gmail.com'),
                                ),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
