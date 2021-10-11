import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:zomato_clone/screens/home/home.dart';
import 'package:zomato_clone/screens/login/login_screen.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0x00000000),
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorConstant.colorBackground,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColorDark: ColorConstant.colorPrimaryDark,
        primaryColor: ColorConstant.colorPrimary,
        accentColor: ColorConstant.colorAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  HomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
