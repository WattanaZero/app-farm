// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:appfarm/widgets/topbar/appbarBg.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';

class AdminPage extends StatefulWidget {
  AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class SalesData {
  SalesData(this.x, this.y);
  final String x;
  final double y;
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class _AdminPageState extends State<AdminPage> {
  TooltipBehavior? _tooltipBehavior1, _tooltipBehavior2,_tooltipBehavior3,_tooltipBehavior4;
  final int yearNow = (new DateTime.now().year + 543);
  int? valueYear;
  int? yearSelect;
  int? yearSelectThai;
  @override
  void initState() {
    super.initState();
    _tooltipBehavior1 = TooltipBehavior(enable: true);
    _tooltipBehavior2 = TooltipBehavior(enable: true);
    _tooltipBehavior3 = TooltipBehavior(enable: true);
    _tooltipBehavior4 = TooltipBehavior(enable: true);
    yearSelect = (new DateTime.now().year);
    yearSelectThai = (new DateTime.now().year + 543);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var percenW = size.width / 100;
    var isTablet = size.width > 600;
    return AppbarBg(
      title: 'ผู้ดูเเล',
      subTitle: 'ผู้ดูเเลระบบ',
      topWidget: Column(
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 10, top: 4, bottom: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      color: Color(0xFF1F78B4),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "ประจำปีพุธศักราช",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFDFF0FF),
                      ),
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(15.0),
                        hint: Text(yearNow.toString()),
                        isExpanded: true,
                        value: yearSelectThai.toString(),
                        icon: Icon(Icons.keyboard_arrow_down),
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'Cloud'),
                        underline: Container(
                          height: 1.0,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.transparent, width: 0.0))),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            yearSelect = int.parse(newValue!) - 543;
                            yearSelectThai = int.parse(newValue);
                          });
                        },
                        items: [
                          yearNow.toString(),
                          (yearNow - 1).toString(),
                          (yearNow - 2).toString(),
                          (yearNow - 3).toString(),
                          (yearNow - 4).toString(),
                          (yearNow - 5).toString(),
                          (yearNow - 6).toString(),
                          (yearNow - 7).toString(),
                          (yearNow - 8).toString(),
                          (yearNow - 9).toString(),
                          (yearNow - 10).toString(),
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'มูลค่ารวมสินค้า',
                                          style: TextStyle(
                                              fontSize:
                                                  isTablet ? percenW * 3 : 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text('0' + ' บาท',
                                                style: TextStyle(
                                                    fontSize: isTablet
                                                        ? percenW * 3
                                                        : 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                                'อัตราเพิ่มขึ้น ' +
                                                    '0' +
                                                    ' ชิ้น',
                                                style: TextStyle(
                                                    fontSize: isTablet
                                                        ? percenW * 3
                                                        : 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green)),
                                            Text(' | ',
                                                style: TextStyle(
                                                  fontSize: isTablet
                                                      ? percenW * 3
                                                      : 15,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text('อัตราลดลง ' + '0' + ' ชิ้น',
                                                style: TextStyle(
                                                    fontSize: isTablet
                                                        ? percenW * 3
                                                        : 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text('จำนวนสินค้าทั้งหมด 0 ชิ้น',
                                                style: TextStyle(
                                                  fontSize: isTablet
                                                      ? percenW * 3
                                                      : 15,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'มูลค่าสินค้าย้อนหลังตามปีงบประมาณ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isTablet ? percenW * 3 : 14,
                            ),
                          ),
                          margin: EdgeInsets.only(
                            top: 10.0,
                            bottom: 10,
                          ),
                        ),
                        Container(
                          height: 300,
                          // width: 300,
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              primaryYAxis: NumericAxis(
                                  numberFormat: NumberFormat.decimalPattern()),
                              tooltipBehavior: _tooltipBehavior1,
                              series: <ChartSeries<SalesData, String>>[
                                ColumnSeries<SalesData, String>(
                                    name: "มูลค่าสินค้า (บาท)",
                                    dataSource: <SalesData>[
                                      // Separate data source maintained for series - 1
                                      SalesData('2561', 100000),
                                      SalesData('2562', 216500),
                                      SalesData('2563', 215620),
                                      SalesData('2564', 525612),
                                    ],
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.x,
                                    yValueMapper: (SalesData sales, _) => sales
                                        .y, // same y variable used but assign y data value from series -1 data source.
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(30)),
                                    width: 0.5,
                                    enableTooltip: true,
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true),
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xFFee3b0e),
                                        Color(0xFFf20976),
                                      ],
                                    )),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'แสดงเปอร์เซ็นต์ของสินค้าเเยกตามประเภท',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? percenW * 3 : 14,
                          ),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      ),
                      Center(
                        child: Container(
                          height: 300,
                          // width: 300,
                          child: SfCircularChart(
                              tooltipBehavior: _tooltipBehavior2,
                              legend: Legend(isVisible: true),
                              series: <CircularSeries>[
                                // Renders doughnut chart
                                PieSeries<ChartData, String>(
                                  name: "จำนวนสินค้า  (รายการ)",
                                  dataSource: <ChartData>[
                                    ChartData('ตระกูลกะหล่ำ', 25, Colors.amber),
                                    ChartData('ตระกูลถั่ว', 38, Colors.blue),
                                    ChartData('ตระกูลมะเขือ', 34, Colors.red),
                                    ChartData('อื่น ๆ', 10, Colors.grey)
                                  ],
                                  pointColorMapper: (ChartData data, _) =>
                                      data.color,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  enableTooltip: true,
                                  dataLabelSettings:
                                      DataLabelSettings(isVisible: true),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'สรุปรายการตรวจสินค้า',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? percenW * 3 : 14,
                          ),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      ),
                      Center(
                        child: Container(
                          height: 300,
                          // width: 300,
                          child: SfCircularChart(
                              tooltipBehavior: _tooltipBehavior3,
                              legend: Legend(isVisible: true),
                              series: <CircularSeries>[
                                // Renders doughnut chart
                                DoughnutSeries<ChartData, String>(
                                  name: "จำนวนสินค้า  (รายการ)",
                                  dataSource: <ChartData>[
                                    ChartData('รอตรวจ', 50,
                                        Color.fromRGBO(9, 0, 136, 1)),
                                    ChartData('ตรวจเเล้ว', 100,
                                        Color.fromRGBO(147, 0, 119, 1)),
                                    ChartData('ผักส่งเคลม', 12,
                                        Color.fromRGBO(228, 0, 124, 1)),
                                    ChartData('อื่น ๆ', 10,
                                        Color.fromRGBO(255, 189, 57, 1))
                                  ],
                                  pointColorMapper: (ChartData data, _) =>
                                      data.color,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  explode: true,
                                  explodeIndex: 1,
                                  enableTooltip: true,
                                  dataLabelSettings:
                                      DataLabelSettings(isVisible: true),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'แสดงข้อมูลสินค้าที่หมดอายุตามปี',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isTablet ? percenW * 3 : 14,
                            ),
                          ),
                          margin: EdgeInsets.only(
                            top: 10.0,
                            bottom: 10,
                          ),
                        ),
                        Container(
                          height: 300,
                          // width: 300,
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              primaryYAxis: NumericAxis(
                                  numberFormat: NumberFormat.decimalPattern()),
                              tooltipBehavior: _tooltipBehavior4,
                              series: <ChartSeries<SalesData, String>>[
                                SplineAreaSeries<SalesData, String>(
                                    name: "ข้อมูลสินค้า (บาท)",
                                    dataSource: <SalesData>[
                                      // Separate data source maintained for series - 1
                                      SalesData('2561', 32540),
                                      SalesData('2562', 10056),
                                      SalesData('2563', 10056),
                                      SalesData('2564', 20054),
                                      SalesData('2565', 50004),
                                      SalesData('2566', 30055),
                                      SalesData('2567', 70005),
                                    ],
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.x,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.y,
                                    enableTooltip: true,
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true),
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xFFffb000),
                                        Color(0xFFf20976),
                                      ],
                                    )),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              constraints:
                  BoxConstraints(minWidth: MediaQuery.of(context).size.width),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        'สรุปจำนวนสินค้า',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      margin: EdgeInsets.only(
                        top: 10.0,
                        bottom: 10,
                      ),
                    ),
                    DataTable(
                      // headingRowColor:   MaterialStateColor.resolveWith((states) => Colors.blue),
                      columns: [
                        DataColumn(
                          label: Text(
                            'งบประมาณประจำปี',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                            label: Text('จำนวนสินค้าทั้งหมด',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('จำนวนสินค้าเคลม',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('จำนวนสินค้าผ่าน',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('ผักกะหล่ำ')),
                            DataCell(Text('19')),
                            DataCell(Text('100')),
                            DataCell(Text('25')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('ผักบุ้ง')),
                            DataCell(Text('100')),
                            DataCell(Text('56')),
                            DataCell(Text('1000')),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
