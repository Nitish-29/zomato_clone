import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/screens/home/pro/pro_member_card.dart';
import 'package:zomato_clone/screens/home/pro/pro_offer_brands_list_view.dart';
import 'package:zomato_clone/screens/home/pro/restaurants_options.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class ZomatoProBuyScreen extends StatefulWidget {
  bool isTwelveMonths = false;

  ZomatoProBuyScreen({Key? key, required this.isTwelveMonths})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ZomatoProBuyScreenState();
}

class _ZomatoProBuyScreenState extends State<ZomatoProBuyScreen> {
  bool isTwelveMonths = false;

  @override
  void initState() {
    super.initState();
    isTwelveMonths = widget.isTwelveMonths;
  }

  Text _buildTextView(String text, TextStyle textStyle) {
    return Text(
      text,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _buildProCard,
            _buildProPlusCard,
            Container(
              margin: DimenConstant.marginTop_16,
              child: _buildTextView(StringConstant.textHaveQuestion,
                  TextStyles.textStyleResuatrant),
            ),
            _buildTextView(
                StringConstant.textChatUs, TextStyles.textStyleProMember),
            Container(
              height: DimenConstant.dimen_2,
              width: DimenConstant.dimen_100,
              margin: DimenConstant.marginTop_1,
              child: const Divider(
                height: DimenConstant.dimen_2,
                color: ColorConstant.colorBlack,
              ),
            ),
            Container(
              margin: DimenConstant.marginAll_16,
              child: Center(
                child: _buildTextView(
                    StringConstant.textProDeals, TextStyles.textStyleProMember),
              ),
            ),
            Container(
              margin: DimenConstant.marginAll_16,
              height: DimenConstant.dimen_50,
              decoration: const BoxDecoration(
                borderRadius: DimenConstant.radius_10,
                color: ColorConstant.colorlightGrey2,
              ),
              child: const RestaurantOptions(),
            ),
            _buildBrandOffers,
          ],
        ),
      ),
    );
  }

  SizedBox get _buildProPlusCard {
    return SizedBox(
        height: DimenConstant.dimen_300,
        child: ProMemberCard(isTwelveMonths: isTwelveMonths, isProPlus: true));
  }

  SizedBox get _buildProCard {
    return SizedBox(
      height: DimenConstant.dimen_370,
      child: ProMemberCard(isTwelveMonths: isTwelveMonths, isProPlus: false),
    );
  }

  Container get _buildBrandOffers {
    return Container(
      margin: DimenConstant.marginTop_10,
      padding: DimenConstant.marginLTRB_8088,
      height: DimenConstant.dimen_280,
      child: ProOfferBrandListView(),
    );
  }
}
