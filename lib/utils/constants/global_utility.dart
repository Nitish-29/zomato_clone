import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'color_constant.dart';

class GlobalUtility {
  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = ColorConstant.colorAccent
      ..backgroundColor = Colors.transparent
      ..textColor = Colors.redAccent
      ..indicatorColor = ColorConstant.colorAccent
      ..maskColor = Colors.redAccent
      ..maskType = EasyLoadingMaskType.none
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  static void transparentStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
  }


  static void showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: ColorConstant.rippleColor,
        textColor: ColorConstant.colorBlack,
        fontSize: 16.0);
  }

  static void showSnackBar(String text) {
    Get.snackbar(
      "Error",
      text,
      icon: const Icon(Icons.phone, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorConstant.colorBlack45,
      colorText: ColorConstant.colorWhite,
    );
  }
}
