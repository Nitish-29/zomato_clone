import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:zomato_clone/screens/login/login_screen.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class CredentialsScreen extends StatefulWidget {
  const CredentialsScreen({Key? key}) : super(key: key);

  @override
  _CredentialsScreenState createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends State<CredentialsScreen> {
  bool isObscureText = true;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  void showPassword(TapDownDetails details) {
    setState(() {
      isObscureText = false;
    });
  }

  void hidePassword(TapUpDetails details) {
    setState(() {
      isObscureText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: _emailPasswordWidget(),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _emailField,
        const SizedBox(height: 10),
        //_emailPassword,
      ],
    );
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

  Widget get _emailPassword {
    return Visibility(
      visible: LoginScreenState.isVisible,
      child: Container(
        height: DimenConstant.dimen_60,
        margin: DimenConstant.marginAll_8,
        child: Stack(
          children: <Widget>[
            Focus(
              onFocusChange: (bool focus) {
                setState(() {
                  isPasswordFocused = !isPasswordFocused;
                });
              },
              child: TextField(
                controller: _passwordTextController,
                obscureText: isObscureText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: ColorConstant.colorBackground,
                  focusedBorder: _outlineInputBorder,
                  errorMaxLines: 2,
                  hintText: StringConstant.textEnterPassword,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelText: isPasswordFocused
                      ? StringConstant.textPassword
                      : _emailTextController.text.isEmpty
                          ? StringConstant.textEnterPassword
                          : "",
                  labelStyle: isPasswordFocused
                      ? TextStyles.textStyleLoginLabel
                      : TextStyles.textStyleLoginHint,
                  suffixIcon: GestureDetector(
                    onTapDown: showPassword,
                    onTapUp: hidePassword,
                    child: Icon(
                      isObscureText ? MdiIcons.eye : MdiIcons.eyeOff,
                      color: ColorConstant.colorLightBLue,
                    ),
                  ),
                  filled: true,
                ),
              ),
            ),
            Align(
              child: Container(
                margin: EdgeInsets.only(
                    top: _passwordTextController.text.isEmpty
                        ? DimenConstant.dimen_30
                        : DimenConstant.dimen_40,
                    left: DimenConstant.dimen_12),
                child: Visibility(
                  visible: !isPasswordFocused,
                  child: const Divider(
                    height: 0.5,
                    color: ColorConstant.colorGrey,
                  ),
                ),
              ),
            )
          ],
        ),
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
