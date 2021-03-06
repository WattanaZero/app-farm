// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, unused_local_variable, unnecessary_new

import 'package:appfarm/Screens/detail/product_detail.dart';
import 'package:appfarm/Screens/detail/product_detail_check.dart';
import 'package:appfarm/api/http_service.dart';
import 'package:appfarm/model/CountAsset.modal.dart';
import 'package:appfarm/model/CountAssetDetail.model.dart';
import 'package:appfarm/model/constants.dart';
import 'package:appfarm/widgets/text/text_row.dart';
import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SummaryDetail extends StatefulWidget {
  // SummaryDetail({Key? key}) : super(key: key);
  final String? id;
  SummaryDetail({this.id});
  @override
  _summaryDetailState createState() => _summaryDetailState(id: id);
}

class _summaryDetailState extends State<SummaryDetail> {
  _summaryDetailState({this.id});
  final String? id;
  CountAssetDetail? data;

  Future<bool> getAsset() async {
    var res = await HttpService.getHttpMap(
        "/api/test/get-count-asset/" + id.toString(), context);
    print(res);
    data = CountAssetDetail.fromJson(res);
    String countDate = data!.data!.countDate.toString();
    data!.data?.countDate =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(countDate)).toString();
    return true;
  }

  Future<bool> getAssetDetail() async {
    var res = await HttpService.getHttpMap(
        "/api/test/get-count-asset/" + id.toString(), context);
    print(res);
    data = CountAssetDetail.fromJson(res);
    String countDate = data!.data!.countDate.toString();
    data!.data?.countDate =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(countDate)).toString();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return AppbarBg(
      title: '???????????????????????????????????????',
      topWidget: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: FutureBuilder(
              future: getAsset(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  // ignore: curly_braces_in_flow_control_structures
                  return Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "???????????????????????????????????????",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: isTablet ? percenW * 3 : 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextRow(listText: [
                                  '????????????????????????????????????????????????',
                                  (data?.data?.countNumber).toString()
                                ]),
                                TextRow(listText: [
                                  '???????????????????????????????????????????????????',
                                  (data?.data?.creator).toString()
                                ]),
                                TextRow(listText: [
                                  '?????????????????????????????????????????????',
                                  (data?.data?.countDate).toString()
                                ]),
                                TextRow(
                                    listText: ['???????????????????????????????????????', '15/12/2022']),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                else
                  return spinkit;
              })),
      child: ListView(
        children: [
          FutureBuilder(
              future: getAssetDetail(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 140,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '??????????????????????????????',
                                          style: TextStyle(
                                              fontSize:
                                                  isTablet ? percenW * 3 : 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Scrollbar(
                                            thickness: 2,
                                            isAlwaysShown: true,
                                            child: ListView(
                                              children: [
                                                Text(
                                                    (data?.data?.creator)
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: isTablet
                                                            ? percenW * 2.5
                                                            : 15,
                                                        fontWeight:
                                                            FontWeight.w100))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 140,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: CircularPercentIndicator(
                                      animationDuration: 500,
                                      radius: size.width / (isTablet ? 15 : 12),
                                      lineWidth: size.width / 45,
                                      animation: true,
                                      percent: 0.7,
                                      center: Text(
                                        "${data?.data?.numberTotoalCount}/${data?.data?.totalCount}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: percenW * 4),
                                      ),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      progressColor: Colors.blue[900],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    LinearPercentIndicator(
                                                      trailing: Row(
                                                        children: [
                                                          Container(
                                                            width: size.width *
                                                                .15,
                                                            height: 40,
                                                            child: Card(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0)),
                                                              color: Color(
                                                                  0xffDFF0FF),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: new Text(
                                                                      (data?.data
                                                                              ?.normalNumber)
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            percenW *
                                                                                4,
                                                                        color: Color(
                                                                            0xff2B447D),
                                                                      )),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text('?????????????????????',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    isTablet
                                                                        ? 16
                                                                        : 12.0,
                                                                color: Color(
                                                                    0xff1ABB3F),
                                                              ))
                                                        ],
                                                      ),
                                                      width: isTablet
                                                          ? size.width * .65
                                                          : size.width * .46,
                                                      animation: true,
                                                      lineHeight: 12,
                                                      animationDuration: 2500,
                                                      percent: 0.8,
                                                      barRadius:
                                                          Radius.circular(10),
                                                      progressColor:
                                                          Colors.green,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    LinearPercentIndicator(
                                                      trailing: Row(
                                                        children: [
                                                          Container(
                                                            width: size.width *
                                                                .15,
                                                            height: 40,
                                                            child: Card(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0)),
                                                              color: Color(
                                                                  0xffDFF0FF),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: new Text(
                                                                      (data?.data
                                                                              ?.wornOutNumber)
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            percenW *
                                                                                4,
                                                                        color: Color(
                                                                            0xff2B447D),
                                                                      )),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text('??????????????????????????????',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    isTablet
                                                                        ? 16
                                                                        : 12.0,
                                                                color: Colors
                                                                    .orange,
                                                              ))
                                                        ],
                                                      ),
                                                      width: isTablet
                                                          ? size.width * .65
                                                          : size.width * .46,
                                                      animation: true,
                                                      lineHeight: 12,
                                                      animationDuration: 2500,
                                                      percent: 0.2,
                                                      barRadius:
                                                          Radius.circular(10),
                                                      progressColor:
                                                          Colors.orange[100],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    LinearPercentIndicator(
                                                      trailing: Row(
                                                        children: [
                                                          Container(
                                                            width: size.width *
                                                                .15,
                                                            height: 40,
                                                            child: Card(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0)),
                                                              color: Color(
                                                                  0xffDFF0FF),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: new Text(
                                                                      (data?.data
                                                                              ?.repairNumber)
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            percenW *
                                                                                4,
                                                                        color: Color(
                                                                            0xff2B447D),
                                                                      )),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text('??????????????????????????????',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    isTablet
                                                                        ? 16
                                                                        : 12.0,
                                                                color:
                                                                    Colors.red,
                                                              ))
                                                        ],
                                                      ),
                                                      width: isTablet
                                                          ? size.width * .65
                                                          : size.width * .46,
                                                      animation: true,
                                                      lineHeight: 12,
                                                      animationDuration: 2500,
                                                      percent: 0,
                                                      barRadius:
                                                          Radius.circular(10),
                                                      progressColor:
                                                          Colors.red[100],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ))))),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 450,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: DefaultTabController(
                                          length: 2,
                                          child: Column(children: [
                                            TabBar(
                                                labelPadding: EdgeInsets.zero,
                                                indicatorWeight: 0.1,
                                                tabs: [
                                                  Tab(
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 60,
                                                      child: Card(
                                                        elevation: 0,
                                                        color: Colors.orange,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '?????????????????????????????????????????????????????????',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      isTablet
                                                                          ? 20
                                                                          : 15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 60,
                                                      child: Card(
                                                        elevation: 0,
                                                        color: Colors.green,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '???????????????????????????????????????????????????',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      isTablet
                                                                          ? 20
                                                                          : 15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                            Flexible(
                                              child: Container(
                                                child: TabBarView(
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 500,
                                                              child: ListView(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                ProductDetail(),
                                                                          )).then((value) {});
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                            width: isTablet
                                                                                ? 125
                                                                                : 100,
                                                                            height: isTablet
                                                                                ? 125
                                                                                : 100,
                                                                            padding: const EdgeInsets.fromLTRB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Card(
                                                                              elevation: 0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              color: Color(0xffDFF0FF),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(7.0),
                                                                                child: Column(
                                                                                  children: <Widget>[
                                                                                    Image.asset(
                                                                                      'assets/img/image.png',
                                                                                      width: isTablet ? 100 : 75,
                                                                                      height: isTablet ? 100 : 75,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              height: isTablet ? 125 : 100,
                                                                              child: Card(
                                                                                elevation: 0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                color: Color(0xffDFF0FF),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: <Widget>[
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: Text('??????????????????????????????',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  )),
                                                                                            ),
                                                                                            Container(
                                                                                              child: Text('| ' + '?????????????????????',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.w100,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  ),
                                                                                                  overflow: TextOverflow.ellipsis),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                                                        child: Row(
                                                                                          children: <Widget>[
                                                                                            Container(
                                                                                              child: Text('??????????????????',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  )),
                                                                                            ),
                                                                                            Container(
                                                                                              child: Text('| ' + '6760-015-001',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.w100,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  ),
                                                                                                  overflow: TextOverflow.ellipsis),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: Text('???????????????',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  )),
                                                                                            ),
                                                                                            Container(
                                                                                              child: Text('| ' + '-',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.w100,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  ),
                                                                                                  overflow: TextOverflow.ellipsis),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 500,
                                                              child: ListView(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                ProductDetailCheck(),
                                                                          )).then((value) {});
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                            width: isTablet
                                                                                ? 125
                                                                                : 100,
                                                                            height: isTablet
                                                                                ? 125
                                                                                : 100,
                                                                            padding: const EdgeInsets.fromLTRB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Card(
                                                                              elevation: 0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              color: Color(0xffDFF0FF),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(7.0),
                                                                                child: Column(
                                                                                  children: <Widget>[
                                                                                    Image.asset(
                                                                                      'assets/img/harvest.png',
                                                                                      width: isTablet ? 100 : 75,
                                                                                      height: isTablet ? 100 : 75,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              height: isTablet ? 125 : 100,
                                                                              child: Card(
                                                                                elevation: 0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                color: Color(0xffDFF0FF),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: <Widget>[
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: Text('??????????????????????????????',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  )),
                                                                                            ),
                                                                                            Container(
                                                                                              child: Text('| ' + '?????????????????????',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.w100,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  ),
                                                                                                  overflow: TextOverflow.ellipsis),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                                                        child: Row(
                                                                                          children: <Widget>[
                                                                                            Container(
                                                                                              child: Text('??????????????????',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  )),
                                                                                            ),
                                                                                            Container(
                                                                                              child: Text('| ' + '6760-015-001',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.w100,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  ),
                                                                                                  overflow: TextOverflow.ellipsis),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: Text('???????????????',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  )),
                                                                                            ),
                                                                                            Container(
                                                                                              child: Text('| ' + '-',
                                                                                                  style: TextStyle(
                                                                                                    fontWeight: FontWeight.w100,
                                                                                                    fontSize: isTablet ? 16 : 12.0,
                                                                                                  ),
                                                                                                  overflow: TextOverflow.ellipsis),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ]),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  );
                else
                  return spinkit;
              }),
        ],
      ),
    );
  }
}
