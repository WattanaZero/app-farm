
// ignore_for_file: unnecessary_this

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardAdmin {
  String? status;
  String? message;
  List<DashboardAdminData>? data;

  DashboardAdmin({this.status, this.message, this.data});

  DashboardAdmin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DashboardAdminData>[];
      json['data'].forEach((v) {
        data?.add(new DashboardAdminData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DashboardAdminData {
  String? name;
  double? value;
  String? parent;
  double? money;
  String? masterDepartmentsCode;
  double? percent;
  String? percentText;
  Color? color;

  DashboardAdminData(
      {this.name,
      this.value,
      this.parent,
      this.money,
      this.color,
      this.masterDepartmentsCode,
      this.percent,
      this.percentText});

  DashboardAdminData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = double.parse(json['value'].toString());
    parent = json['parent'];
    money = double.parse(json['money']?.toString() ?? '0');
    masterDepartmentsCode = json['masterDepartmentsCode'];
    percent = double.parse(json['percent']?.toString() ?? '0');
    percentText = json['percentText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['parent'] = this.parent;
    data['money'] = this.money;
    data['masterDepartmentsCode'] = this.masterDepartmentsCode;
    data['percent'] = this.percent;
    data['percentText'] = this.percentText;
    return data;
  }
}
