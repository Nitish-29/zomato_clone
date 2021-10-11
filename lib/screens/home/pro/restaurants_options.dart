import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class RestaurantOptions extends StatefulWidget {
  const RestaurantOptions({Key? key}) : super(key: key);

  @override
  _RestaurantOptionsState createState() => _RestaurantOptionsState();
}

class _RestaurantOptionsState extends State<RestaurantOptions> {
  bool isDeliverySelected = true;
  final FadeInController _controller = FadeInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      body: buildRadioBox(context),
    );
  }

  Row buildRadioBox(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              isDeliverySelected = true;
              _controller.fadeIn();
            });
          },
          child: Stack(
            children: <Widget>[
              if (isDeliverySelected)
                _buildButtonDelivery(context, StringConstant.textDelivery,
                    TextStyles.textStyleProDelivery)
              else
                _buildButtonDining(context, StringConstant.textDelivery,
                    TextStyles.textStyleOrderInfo),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isDeliverySelected = false;
              _controller.fadeOut();
            });
          },
          child: Stack(
            children: <Widget>[
              if (isDeliverySelected)
                _buildButtonDining(context, StringConstant.textDining,
                    TextStyles.textStyleOrderInfo)
              else
                _buildButtonDelivery(context, StringConstant.textDining,
                    TextStyles.textStyleProDelivery),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildButtonDining(
      BuildContext context, String text, TextStyle textStyle) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      height: DimenConstant.dimen_50,
      decoration: const BoxDecoration(
        borderRadius: DimenConstant.radius_10,
        color: ColorConstant.colorlightGrey2,
      ),
      child: Center(
        child: _buildTextView(text, textStyle),
      ),
    );
  }

  FadeIn _buildButtonDelivery(
      BuildContext context, String text, TextStyle textStyle) {
    return FadeIn(
      duration: const Duration(milliseconds: 800),
      child: Container(
          width: MediaQuery.of(context).size.width / 2.2,
          height: DimenConstant.dimen_50,
          decoration: const BoxDecoration(
            borderRadius: DimenConstant.radius_10,
            color: ColorConstant.colorBlack,
          ),
          child: Center(
            child: _buildTextView(text, textStyle),
          )),
    );
  }

  Text _buildTextView(String text, TextStyle textStyle) {
    return Text(
      text,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}
