import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class ProMemberCard extends StatefulWidget {
  bool isTwelveMonths = false;
  bool isProPlus = false;

  ProMemberCard(
      {Key? key, required this.isTwelveMonths, required this.isProPlus})
      : super(key: key);

  @override
  _ProMemberCardState createState() => _ProMemberCardState();
}

class _ProMemberCardState extends State<ProMemberCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      body: Column(
        children: <Widget>[
          if (widget.isProPlus)
            _buildProPlusMemberCard(context)
          else
            _buildProMemberCard(context)
        ],
      ),
    );
  }

  Text _buildTextView(String text, TextStyle textStyle) {
    return Text(
      text,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }

  FadeIn _buildProMemberCard(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 800),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: DimenConstant.dimen_350,
        margin: DimenConstant.marginTop_16,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: DimenConstant.radius_16,
          ),
          elevation: 5,
          margin: DimenConstant.marginAll_16,
          child: Column(
            children: <Widget>[
              const Spacer(),
              _buildTextMemberShipType(StringConstant.textProMemberShip),
              _buildTextView(StringConstant.textDiningOffer,
                  TextStyles.textStyleResuatrant),
              _buildDivider,
              _buildTextView(StringConstant.textDeliveryOffer,
                  TextStyles.textStyleResuatrant),
              _buildDivider,
              _buildTextView(StringConstant.textOfferRestauants,
                  TextStyles.textStyleResuatrant),
              _buildBuyMemberButton(context),
              _buildTextMembershipInfo,
              _buildMembershipExpireInfo(context, ColorConstant.colorLightRed2,
                  StringConstant.textMembershipEnd, DimenConstant.dimen_40)
            ],
          ),
        ),
      ),
    );
  }

  Container _buildProPlusMemberCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: DimenConstant.dimen_280,
      margin: DimenConstant.marginTop_16,
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: DimenConstant.radius_16,
          ),
          elevation: 2,
          margin: DimenConstant.marginAll_16,
          color: ColorConstant.colorlightGrey2,
          child: Column(
            children: <Widget>[
              _buildInviteOnlyBtn,
              _buildTextMemberShipType(StringConstant.textProPlusMemberShip),
              _buildTextView(StringConstant.textFreeDelivery,
                  TextStyles.textStyleRestaurantName),
              _buildDivider,
              _buildTextView(StringConstant.textProBenefit,
                  TextStyles.textStyleRestaurantName),
              _buildMembershipExpireInfo(context, ColorConstant.colorLightRed,
                  StringConstant.textProMembershipBuy, DimenConstant.dimen_80)
            ],
          )),
    );
  }

  Row get _buildTextMembershipInfo {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.error_outline,
          size: DimenConstant.dimen_14,
          color: ColorConstant.colorDarkRed,
        ),
        Container(
            margin: DimenConstant.marginLeft_10,
            child: _buildTextView(StringConstant.textNoFreeDelivery,
                TextStyles.textStyleFreeDelivery)),
      ],
    );
  }

  Container _buildBuyMemberButton(BuildContext context) {
    return Container(
      margin: DimenConstant.marginAll_16,
      width: MediaQuery.of(context).size.width,
      height: DimenConstant.dimen_60,
      decoration: const BoxDecoration(
        borderRadius: DimenConstant.radius_8,
        color: ColorConstant.colorDarkRed,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTextView(
                StringConstant.textRenewPro, TextStyles.textStylePro),
            _buildTextView(
                StringConstant.textMembershipDuration(widget.isTwelveMonths),
                TextStyles.textStyleName),
          ],
        ),
      ),
    );
  }

  Container get _buildDivider {
    return Container(
      margin: DimenConstant.marginAll_8,
      width: DimenConstant.dimen_200,
      height: 0.5,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              ColorConstant.colorWhite,
              ColorConstant.colorBlack,
              ColorConstant.colorWhite
            ],
          ),
        ),
      ),
    );
  }

  Align _buildMembershipExpireInfo(
      BuildContext context, Color colorBackground, String text, double height) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: DimenConstant.marginTop_16,
        width: MediaQuery.of(context).size.width,
        height: height,
        color: colorBackground,
        child: Center(
          child: Container(
            padding: DimenConstant.marginAll_8,
            child: _buildTextView(text, TextStyles.textStyleLocation),
          ),
        ),
      ),
    );
  }

  Container _buildTextMemberShipType(String text) {
    return Container(
        margin: DimenConstant.marginAll_16,
        child: _buildTextView(text, TextStyles.textStyleProMember));
  }

  Container get _buildInviteOnlyBtn {
    return Container(
      margin: DimenConstant.marginTop_16,
      width: DimenConstant.dimen_120,
      height: DimenConstant.dimen_25,
      decoration: const BoxDecoration(
        borderRadius: DimenConstant.radius_8,
        color: ColorConstant.colorGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.lock_open,
            size: DimenConstant.dimen_12,
            color: ColorConstant.colorWhite,
          ),
          _buildTextView(
              StringConstant.textInviteOnly, TextStyles.textStyleInvite),
        ],
      ),
    );
  }
}
