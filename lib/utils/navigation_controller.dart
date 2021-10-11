import 'package:get/get.dart';
import 'package:zomato_clone/screens/home/home.dart';
import 'package:zomato_clone/screens/login/login_screen.dart';
import 'package:zomato_clone/screens/login/otp_screen.dart';
import 'package:zomato_clone/screens/profile/profile_screen.dart';

class NavigationController {
  static void navigateToHome() {
    Get.offAll(() => const HomeScreen());
//    Get.off(const HomeScreen());
  }

  static void navigateToLogin() {
    Get.off(() => const LoginScreen());
  }

  static void navigateToProfile() {
    Get.to(() => const ProfileScreen());
  }

  static void navigateToOTP() {
    Get.to(() => const OtpScreen());
  }
}
