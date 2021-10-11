import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/global_utility.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';
import 'package:zomato_clone/utils/navigation_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  bool isOTPEntered = false;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    GlobalUtility.showToast("OTP Send Successfully");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      appBar: AppBar(
        backgroundColor: ColorConstant.colorBackground,
        toolbarHeight: 50.0,
        title: Text("Enter Verification Code",
            style: TextStyles.textStyleOrderInfo),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: Center(
                child: Text(
                  "We have send verification code to your phone number",
                  style: TextStyles.textStyleRestaurantName,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 50),
            _otpLayout(context),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: DimenConstant.marginBottom_16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CountdownTimer(
                        controller: controller,
                        onEnd: onEnd,
                        textStyle: TextStyles.textStyleRestaurantName,
                        endTime: endTime,
                        endWidget: Text("Didn't receive the code? Resend OTP",
                            style: TextStyles.textStyleRestaurantName),
                      ),
                      const SizedBox(height: 20),
                      Visibility(visible: isOTPEntered, child: _submitButton)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _otpLayout(BuildContext context) => Container(
        margin: DimenConstant.marginLR_16,
        child: PinCodeTextField(
          length: 6,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              borderWidth: 1,
              inactiveFillColor: ColorConstant.colorBackground,
              selectedFillColor: ColorConstant.colorWhite,
              activeFillColor: ColorConstant.colorBackground,
              activeColor: ColorConstant.colorBlack,
              inactiveColor: ColorConstant.colorBlack),
          animationType: AnimationType.fade,
          enableActiveFill: true,
          keyboardType: TextInputType.number,
          textStyle: TextStyles.textStyleRestaurantName,
          animationDuration: const Duration(milliseconds: 300),
          // Pass it here
          onCompleted: (String value) {
            setState(() {
              isOTPEntered = true;
            });
          },
          onChanged: (String value) {},
          appContext: context,
        ),
      );

  Widget get _submitButton {
    final Container loginBtn = Container(
      width: MediaQuery.of(context).size.width,
      margin: DimenConstant.marginLR_16,
      height: DimenConstant.dimen_44,
      padding: DimenConstant.marginAll_8,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: DimenConstant.radius_8,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: ColorConstant.colorlightGrey2,
              offset: Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2)
        ],
        gradient: LinearGradient(colors: <Color>[
          ColorConstant.colorCurve1,
          ColorConstant.colorCurve2
        ]),
      ),
      child:
          Text(StringConstant.textVerifyOtp, style: TextStyles.textStyleLogin),
    );

    return InkWell(
      onTap: () {
        NavigationController.navigateToHome();
      },
      child: loginBtn,
    );
  }

  void onEnd() {
    print('onEnd');
  }
}
