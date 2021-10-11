import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      body: _socialLoginButtons(context),
    );
  }

  Widget _socialLoginButtons(BuildContext context) {
    return Column(
      children: <Widget>[
        _emailLogin(context),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _facebookLoginRound(context),
              _googleLoginRound(context),
            ],
          ),
        ),
      ],
    );
  }

  Container _facebookLoginRound(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: DimenConstant.dimen_50,
      margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      decoration: const BoxDecoration(
        borderRadius: DimenConstant.radius_8,
        color: ColorConstant.colorWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/facebook.png"),
          ),
          Text(StringConstant.textFacebook, style: TextStyles.textFacebookLogin)
        ],
      ),
    );
  }

  Container _googleLoginRound(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: DimenConstant.dimen_50,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: const BoxDecoration(
        borderRadius: DimenConstant.radius_10,
        color: ColorConstant.colorWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/google.png"),
          ),
          Text(StringConstant.textGoogle, style: TextStyles.textFacebookLogin)
        ],
      ),
    );
  }

  Container _emailLogin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: DimenConstant.dimen_50,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: const BoxDecoration(
        borderRadius: DimenConstant.radius_10,
        color: ColorConstant.colorWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: const Icon(Icons.email, color: ColorConstant.colorBlack),
          ),
          Text(StringConstant.textContinueEmail,
              style: TextStyles.textFacebookLogin)
        ],
      ),
    );
  }
}
