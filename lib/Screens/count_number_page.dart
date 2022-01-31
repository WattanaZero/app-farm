import 'package:appfarm/Screens/detail/summary_detail.dart';
import 'package:appfarm/api/http_service.dart';
import 'package:appfarm/model/CountAsset.modal.dart';
import 'package:appfarm/model/constants.dart';
import 'package:appfarm/model/user_profile.dart';
import 'package:appfarm/widgets/card/card_custom.dart';
import 'package:appfarm/widgets/card/card_mini.dart';
import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CountNumberPage extends StatefulWidget {
  // CountNumberPage({Key? key}) : super(key: key);
  final bool? isNotNow;
  final ProfileData? data;

  CountNumberPage({this.isNotNow, this.data});
  static int total = 0;
  static int work = 0;

  @override
  State<CountNumberPage> createState() => _CountNumberPageState();
}

class _CountNumberPageState extends State<CountNumberPage> {
  final TextEditingController searchText = TextEditingController();
  CountAssetList? dataList;

  Future<bool> getListData() async {
    String path = "/api/test/get-list-data";

    var textSearch = searchText.text.length > 0 ? searchText.text : "-";
    var res = await HttpService.getHttpMap(path, context);
    this.dataList = CountAssetList.fromJson(res);
    CountNumberPage.total = 0;
    CountNumberPage.work = 0;
    for (var index = 0; index < dataList!.data!.length; index++) {
      dataList!.data![index].creator =
          dataList!.data![index].creator?.replaceAll("null", "");

      String countDate = dataList!.data![index].countDate.toString();

      dataList!.data![index].countDate =
          DateFormat('dd/MM/yyyy').format(DateTime.parse(countDate)).toString();

      // CountAssetScreen.total += (null != dataList.data[index].countInvalid
      //             ? dataList.data[index].countInvalid
      //             : 0)
      //         .toInt() +
      //     (null != dataList.data[index].countOutOfBound
      //             ? dataList.data[index].countOutOfBound
      //             : 0)
      //         .toInt() +
      //     (null != dataList.data[index].countValid
      //             ? dataList.data[index].countValid
      //             : 0)
      //         .toInt() +
      //     (null != dataList.data[index].countWaiting
      //             ? dataList.data[index].countWaiting
      //             : 0)
      //         .toInt();
      // CountAssetScreen.work += (null != dataList.data[index].countInvalid
      //             ? dataList.data[index].countInvalid
      //             : 0)
      //         .toInt() +
      //     (null != dataList.data[index].countOutOfBound
      //             ? dataList.data[index].countOutOfBound
      //             : 0)
      //         .toInt() +
      //     (null != dataList.data[index].countValid
      //             ? dataList.data[index].countValid
      //             : 0)
      //         .toInt();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isTablet = size.width > 600;
    var percenW = size.width / 100;

    return AppbarBg(
        title: 'ตรวจนับสินทรัพย์',
        topWidget: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchText,
                          decoration: InputDecoration(
                            hintText: "ค้นหารายการตรวจนับสินทรัพย์",
                            isDense: true, // Added this
                            // border: InputBorder.none,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                                // color: Colors.blue.shade100
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(15),
                          ),
                        ),
                      ),
                      Container(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // getList();
                          });
                        },
                        child: CardMini(
                          background: const Color(0xff0046AF),
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 35,
                          ),
                          size: isTablet ? size.width * .08 : size.width * .16,
                          // text: "ค้นหาสินสินทรัพย์",
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: FutureBuilder(
              future: getListData(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  // ignore: curly_braces_in_flow_control_structures
                  return SizedBox.expand(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await getListData();
                        setState(() {});
                        return;
                      },
                      child: (dataList!.data!.length > 0)
                          // ignore: unnecessary_new
                          ? new ListView.builder(
                              itemCount: dataList!.data!.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext ctxt, int index) {
                                if (dataList!.data!.length > 0)
                                  // ignore: curly_braces_in_flow_control_structures
                                  return GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => SummaryDetail(
                                      //         id: (dataList!.data![index].id).toString(),
                                      //       ),
                                      //     )).then((value) {
                                      //   // setState(() {
                                      //   //   getSearchAssetHdr();
                                      //   // });
                                      // });
                                      print((dataList!.data![index].id).toString());
                                      pushNewScreen(
                                        context,
                                        screen: SummaryDetail(id: (dataList!.data![index].id).toString()),
                                        withNavBar: false,
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino,
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 5),
                                      child: CardCustom(
                                        width:
                                            size.width * (isTablet ? .8 : .8),
                                        height: size.height * 0.25,
                                        padding: 0,
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            CircularPercentIndicator(
                                              animationDuration: 500,
                                              radius: size.width /
                                                  (isTablet ? 15 : 12),
                                              lineWidth: size.width / 45,
                                              animation: true,
                                              percent: ((dataList?.data![index]
                                                          .numberTotoalCount)!
                                                      .toInt()) /
                                                  ((dataList?.data![index]
                                                          .totalCount)!
                                                      .toInt()),
                                              center: Text(
                                                (dataList?.data![index]
                                                            .numberTotoalCount)!
                                                        .toString() +
                                                    " / " +
                                                    (dataList?.data![index]
                                                            .totalCount)!
                                                        .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize: percenW * 2.5),
                                              ),
                                              circularStrokeCap:
                                                  CircularStrokeCap.round,
                                              progressColor: Colors.blue[900],
                                            ),
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 0, 0, 0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  child: Text(
                                                                      'ศุนย์ต้นทุน',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize: isTablet
                                                                            ? 18
                                                                            : 15,
                                                                      )),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          '|' +
                                                                              (dataList?.data![index].costCenter)!.toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w100,
                                                                            fontSize: isTablet
                                                                                ? 18
                                                                                : 15,
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Text(
                                                                            ':' +
                                                                                (dataList?.data![index].creator)!.toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w100,
                                                                              fontSize: isTablet ? 18 : 15,
                                                                            ),
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                        'ผู้สร้างการตรวจนับ',
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize: isTablet
                                                                                ? 18
                                                                                : 15)),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                        '|' +
                                                                            (dataList?.data![index].creator)!
                                                                                .toString(),
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w100,
                                                                            fontSize: isTablet
                                                                                ? 18
                                                                                : 15),
                                                                        overflow:
                                                                            TextOverflow.ellipsis),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                        'เลขที่การตรวจนับ',
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize: isTablet
                                                                                ? 18
                                                                                : 15)),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                        '|' +
                                                                            (dataList?.data![index].countNumber)!
                                                                                .toString(),
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w100,
                                                                            fontSize: isTablet
                                                                                ? 18
                                                                                : 15),
                                                                        overflow:
                                                                            TextOverflow.ellipsis),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                        'วันที่เริ่มตรวจนับ',
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize: isTablet
                                                                                ? 18
                                                                                : 15)),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                        '|' +
                                                                            (dataList?.data![index].countDate)!
                                                                                .toString(),
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w100,
                                                                            fontSize: isTablet
                                                                                ? 18
                                                                                : 15),
                                                                        overflow:
                                                                            TextOverflow.ellipsis),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Container(
                                                            width: 70,
                                                            height: 70,
                                                            child: Card(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .all(
                                                                Radius.circular(
                                                                    8.0),
                                                              )),
                                                              color: Color(
                                                                  0xff1ABB3F),
                                                              child: Column(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          ((dataList!.data![index].normalNumber)?.toInt())
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: isTablet ? 20 : 18),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Text('Normal',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 15
                                                                              : 12))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 70,
                                                            height: 70,
                                                            child: Card(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .all(
                                                                Radius.circular(
                                                                    8.0),
                                                              )),
                                                              color: Color(
                                                                  0xffFF5656),
                                                              child: Column(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          ((dataList!.data![index].wornOutNumber)?.toInt())
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: isTablet ? 20 : 18),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                      'Worn Out',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 15
                                                                              : 12))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 70,
                                                            height: 70,
                                                            child: Card(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .all(
                                                                Radius.circular(
                                                                    8.0),
                                                              )),
                                                              color: Color(
                                                                  0xffFFAE44),
                                                              child: Column(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          ((dataList!.data![index].repairNumber)?.toInt())
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: isTablet ? 20 : 18),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Text('Repair',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 15
                                                                              : 12))
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                else
                                  return SizedBox();
                              },
                            )
                          : Container(
                              height: 200,
                              child: Card(
                                  child: Center(child: Text('ไม่มีข้อมูล')))),
                    ),
                  );
                else
                  return spinkit;
              }),
        ));
  }
}
