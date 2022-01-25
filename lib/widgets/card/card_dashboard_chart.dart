// ignore_for_file: unused_local_variable, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors_in_immutables, unnecessary_this, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:appfarm/Screens/detail/summary_detail.dart';
import 'package:appfarm/widgets/card/card_custom.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CardDashboard extends StatefulWidget {
  final Axis axis;
  CardDashboard({
    Key? key,
    this.axis = Axis.vertical,
  }) : super(key: key);
  @override
  _CardDashboard createState() => _CardDashboard();
}

class _CardDashboard extends State<CardDashboard> {
  _CardDashboard();
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 25),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SummaryDetail(),
              )).then((value) {});
        },
        child: CardCustom(
          width: size.width * (isTablet ? .8 : .8),
          height: size.height * 0.23,
          padding: 0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularPercentIndicator(
                animationDuration: 500,
                radius: size.width / (isTablet ? 15 : 12),
                lineWidth: size.width / 45,
                animation: true,
                percent: 0.7,
                center: Text(
                  "70.0%",
                  style: TextStyle(
                      fontWeight: FontWeight.w100, fontSize: percenW * 4),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.blue[900],
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text('ศุนย์ต้นทุน',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: isTablet ? 18 : 15,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            '|' + '300600001',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: isTablet ? 18 : 15,
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              ':' + 'กลุ่มพัฒนาระบบบริหาร',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: isTablet ? 18 : 15,
                                              ),
                                              overflow: TextOverflow.ellipsis,
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
                                    child: Container(
                                      child: Text('ผู้สร้างการตรวจนับ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: isTablet ? 18 : 15)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                          '|' + '- กลุ่มพัฒนาระบบบริหาร',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: isTablet ? 18 : 15),
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text('เลขที่การตรวจนับ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: isTablet ? 18 : 15)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text('|' + 'ACN21-0321',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: isTablet ? 18 : 15),
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text('วันที่เริ่มตรวจนับ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: isTablet ? 18 : 15)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text('|' + '06/10/2021',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: isTablet ? 18 : 15),
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                )),
                                color: Color(0xff1ABB3F),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '130',
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
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: isTablet ? 15 : 12))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 70,
                              height: 70,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                )),
                                color: Color(0xffFF5656),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '0',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: isTablet ? 20 : 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text('Worn Out',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: isTablet ? 15 : 12))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 70,
                              height: 70,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                )),
                                color: Color(0xffFFAE44),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '7',
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
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: isTablet ? 15 : 12))
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
    ));
  }
}
