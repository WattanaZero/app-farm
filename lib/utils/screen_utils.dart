// ignore_for_file: prefer_const_declarations, constant_identifier_names

import 'package:get/route_manager.dart';

class ScreenUtils {
  static final onePercent = Get.width / 100.0;

  static final tabletConfigHeight = 1000;
  static final smallTabletConfigHeight = 800;
  static final phoneConfigHeight = 600;
  static final smallPhoneConfigHeight = 400;

  static final tabletConfigWidth = 500;
  static final smallTabletConfigWidth = 400;
  static final phoneConfigWidth = 300;
  static final smallPhoneConfigWidth = 200;

  static getByDevice(
    double smallPhoneSize,
    double phoneSize,
    double smallTabletSize,
    double tabletSize,
  ) {
    if (Get.width > tabletConfigWidth) {
      return tabletSize;
    } else if (Get.width > smallTabletConfigWidth) {
      return smallTabletSize;
    } else if (Get.width > smallPhoneConfigWidth) {
      return phoneSize;
    } else {
      return smallPhoneSize;
    }
  }

  static percenWidth(
    double smallPhoneSize,
    double phoneSize,
    double smallTabletSize,
    double tabletSize,
  ) {
    if (Get.width > tabletConfigWidth) {
      return onePercent * tabletSize;
    } else if (Get.width > smallTabletConfigWidth) {
      return onePercent * tabletSize;
    } else if (Get.width > smallPhoneConfigWidth) {
      return onePercent * phoneSize;
    } else {
      return onePercent * smallPhoneSize;
    }
  }

  static percenHeight(
    double smallPhoneSize,
    double phoneSize,
    double smallTabletSize,
    double tabletSize,
  ) {
    if (Get.height > tabletConfigHeight) {
      return onePercent * tabletSize;
    } else if (Get.height > smallTabletConfigHeight) {
      return onePercent * tabletSize;
    } else if (Get.height > phoneConfigHeight) {
      return onePercent * phoneSize;
    } else {
      return onePercent * smallPhoneSize;
    }
  }
}

enum Devices {
  SMALL_PHONE,
  PHONE,
  SMALL_TABLET,
  TABLET,
}
