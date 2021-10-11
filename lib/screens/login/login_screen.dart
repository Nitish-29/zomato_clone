import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:zomato_clone/screens/customui/beizier_container.dart';
import 'package:zomato_clone/screens/login/social_login.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/global_utility.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';
import 'package:zomato_clone/utils/navigation_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  static bool isVisible = true;
  bool isEmailFocused = false;
  final TextEditingController _emailTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    GlobalUtility.configLoading();
  }

  @override
  void dispose() {
    super.dispose();
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    GlobalUtility.transparentStatusBar();
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.colorBackground,
      body: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: const BezierContainer()),
          Container(
            padding: DimenConstant.marginAll_16,
            child: ListView(
              children: <Widget>[
                SizedBox(height: height * .1),
                _titleImage,
                const SizedBox(height: DimenConstant.dimen_20),
                SizedBox(
                  height: DimenConstant.dimen_100,
                  child: _emailField,
                ),
                const SizedBox(height: DimenConstant.dimen_20),
                _submitButton,
                _buildDivider(),
                const SizedBox(
                    height: DimenConstant.dimen_180, child: SocialLogin()),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: DimenConstant.marginLTRB_1601616,
              child: Text(
                StringConstant.textTerms,
                style: TextStyles.textStyleCuisineNames,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get _submitButton {
    final Container loginBtn = Container(
      width: MediaQuery.of(context).size.width,
      margin: DimenConstant.marginLR_16,
      height: DimenConstant.dimen_44,
      padding: DimenConstant.marginAll_8,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: DimenConstant.radius_8,
        gradient: LinearGradient(colors: <Color>[
          ColorConstant.colorCurve1,
          ColorConstant.colorCurve2
        ]),
      ),
      child: Text(StringConstant.textSendOtp, style: TextStyles.textStyleLogin),
    );

    return InkWell(
      onTap: () async {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        if (_emailTextController.text.length == 10) {
          await EasyLoading.show(status: '');
          _verifyPhoneNumber(_auth);
        } else {
          GlobalUtility.showSnackBar("Number must be 10 digit");
        }
      },
      child: loginBtn,
    );
  }

  Container get _titleImage {
    return Container(
      margin: DimenConstant.marginRight_30,
      child: Image.asset("assets/images/delivery.png", height: 150, width: 150),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Row(
        children: <Widget>[
          Container(width: DimenConstant.dimen_20),
          const Expanded(
            child: Padding(
              padding: DimenConstant.marginAll_10,
              child: Divider(thickness: 1),
            ),
          ),
          const Text('or'),
          const Expanded(
            child: Padding(
              padding: DimenConstant.marginAll_10,
              child: Divider(thickness: 1),
            ),
          ),
          Container(width: DimenConstant.dimen_20),
        ],
      ),
    );
  }

// Example code of how to verify phone number
  Future<void> _verifyPhoneNumber(FirebaseAuth _auth) async {
    Future<void> verificationCompleted(
        PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      Get.snackbar(
          "", "Phone number automatically verified $phoneAuthCredential");
    }

    void verificationFailed(FirebaseAuthException authException) {
      setState(() {});
    }

    Future<void> codeSent(String verificationId,
        [int? forceResendingToken]) async {
      EasyLoading.dismiss();
      NavigationController.navigateToOTP();
    }

    void codeAutoRetrievalTimeout(String verificationId) {}

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: "+91${_emailTextController.text}",
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      Get.snackbar("", 'Failed to Verify Phone Number: $e');
    }
  }

  Widget get _emailField {
    return Container(
      height: DimenConstant.dimen_60,
      margin: DimenConstant.marginAll_8,
      child: Stack(
        children: <Widget>[
          Focus(
            onFocusChange: (bool focus) {
              setState(() {
                isEmailFocused = !isEmailFocused;
              });
            },
            child: TextField(
              keyboardType: TextInputType.number,
              maxLength: 10,
              controller: _emailTextController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: _outlineInputBorder,
                  counterText: "",
                  fillColor: ColorConstant.colorBackground,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  filled: true,
                  prefixText: "+91  ",
                  errorMaxLines: 1,
                  hintText: StringConstant.textEnterEmail,
                  labelStyle: isEmailFocused
                      ? TextStyles.textStyleLoginLabel
                      : TextStyles.textStyleLoginHint,
                  labelText: isEmailFocused
                      ? StringConstant.textEmail
                      : _emailTextController.text.isEmpty
                          ? StringConstant.textEnterEmail
                          : " "),
            ),
          ),
          Align(
            child: Container(
              margin: EdgeInsets.only(
                  top: _emailTextController.text.isEmpty
                      ? DimenConstant.dimen_30
                      : DimenConstant.dimen_40,
                  left: DimenConstant.dimen_12),
              child: Visibility(
                visible: !isEmailFocused,
                child: const Divider(
                  height: 0.5,
                  color: ColorConstant.colorGrey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder get _outlineInputBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide:
            const BorderSide(width: 2, color: ColorConstant.colorLightBLue));
  }
}
