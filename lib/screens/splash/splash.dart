import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zomato_clone/utils/navigation_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    startTime();

    return Scaffold(
      body: Image.asset('assets/images/splash.jpg', fit: BoxFit.cover),
    );
  }

  Future<Timer> startTime() async {
    const Duration _duration = Duration(seconds: 10);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    NavigationController.navigateToLogin();
  }
}
