// ignore_for_file: unused_local_variable, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors_in_immutables, unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';

class CardCount extends StatelessWidget {
  final String titleItem;
  final String titleItemOne;
  final int numItemOne;
  final String titleItemTwo;
  final String titleItemThree;
  final int numItemTwo;
  final int count;
  final String cardTitle;
  CardCount(
      {Key? key,
      this.titleItem ='',
      this.titleItemOne = '',
      this.numItemOne = 0,
      this.titleItemTwo = '',
      this.numItemTwo = 0,
      this.titleItemThree = '',
      this.cardTitle = '',
      this.count = 0})
      : super(key: key);
      @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 2,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Row(children: <Widget> [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Text(
                          this.cardTitle,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:percenW *5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget> [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.12,
                              child: Row(
                                children: <Widget> [
                                  Expanded(
                                    child: Container(
                                      child: Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:BorderRadius.circular(15.0),
                                        ),
                                        color: Color(0xffDFF0FF),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisAlignment:MainAxisAlignment.center,
                                            children: <Widget> [
                                              Expanded(
                                                  flex: 3,
                                                  child: FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                        '150',
                                                        style: TextStyle(color: Colors.black,
                                                            fontSize:percenW *3,
                                                            fontWeight:FontWeight.bold),
                                                      ))),
                                              Expanded(
                                                  flex: 1,
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Row(
                                                      crossAxisAlignment:CrossAxisAlignment.center,
                                                      mainAxisAlignment:MainAxisAlignment.center,
                                                      children: <Widget> [
                                                        Icon(
                                                            Icons.check_box_outlined,
                                                            color: Colors.green,
                                                            size: percenW * 3),
                                                        Padding(
                                                          padding:const EdgeInsets.only(left: 5),
                                                          child: Text(this.titleItemOne,
                                                              style: TextStyle(
                                                                  color: Colors.green,
                                                                  fontSize:percenW *3)),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.12,
                              child: Row(
                                children: <Widget> [
                                  Expanded(
                                    child: Container(
                                      child: Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:BorderRadius.circular(15.0),
                                        ),
                                        color: Color(0xffDFF0FF),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisAlignment:MainAxisAlignment.center,
                                            children: <Widget> [
                                              Expanded(
                                                  flex: 3,
                                                  child: FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                        '100',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize:percenW *3,
                                                            fontWeight:FontWeight.bold),
                                                      ))),
                                              Expanded(
                                                  flex: 1,
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Row(
                                                      crossAxisAlignment:CrossAxisAlignment.center,
                                                      mainAxisAlignment:MainAxisAlignment.center,
                                                      children: <Widget> [
                                                        Icon(
                                                            Icons.cancel_presentation_rounded,
                                                            color: Colors.red,
                                                            size: percenW * 3),
                                                        Padding(
                                                          padding:const EdgeInsets.only(left: 5),
                                                          child: Text(this.titleItemTwo,
                                                              style: TextStyle(
                                                                  color: Colors.red,
                                                                  fontSize:percenW *3)),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(children: <Widget> [
                      Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: MediaQuery.of(context).size.height * 0.16,
                              child: Row(
                                children: <Widget> [
                                  Expanded(
                                    child: Container(
                                      child: Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:BorderRadius.circular(15.0),
                                        ),
                                        color: Color(0xffDFF0FF),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisAlignment:MainAxisAlignment.center,
                                            children: <Widget> [
                                              Expanded(
                                                  flex: 3,
                                                  child: FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                        '250',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize:percenW *3,
                                                            fontWeight:FontWeight.bold),
                                                      ))),
                                              Expanded(
                                                  flex: 1,
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Row(
                                                      crossAxisAlignment:CrossAxisAlignment.center,
                                                      mainAxisAlignment:MainAxisAlignment.center,
                                                      children: <Widget> [
                                                        Padding(
                                                          padding:const EdgeInsets.only(left: 5),
                                                          child: Text(this.titleItemThree,
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize:percenW *3)),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ])
                  ])),
            ),
      )
      
    );
  }
}