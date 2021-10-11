import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: DimenConstant.marginAll_10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _backButton(),
              const SizedBox(height: DimenConstant.dimen_20),
              Row(
                children: <Widget>[
                  _userInfoContainer(),
                  _buildNameCircleVIew(),
                ],
              ),
              const SizedBox(height: DimenConstant.dimen_10),
              Container(
                margin: DimenConstant.marginAll_10,
                child: const Divider(
                  height: 0.5,
                  color: ColorConstant.colorlightGrey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _userInfoContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Nitish", style: TextStyles.textStyleProMember),
        const SizedBox(height: DimenConstant.dimen_5),
        Text("nitish@zomato.com", style: TextStyles.textStyleRestaurantCost),
        const SizedBox(height: DimenConstant.dimen_10),
        Text("View activity \u27A2", style: TextStyles.textStyleViewActivity),
      ],
    );
  }

  InkWell _backButton() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: const Icon(
        Icons.arrow_back,
        color: ColorConstant.colorBlack,
      ),
    );
  }

  Expanded _buildNameCircleVIew() {
    return Expanded(
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: DimenConstant.marginRight_10,
          width: DimenConstant.dimen_80,
          height: DimenConstant.dimen_80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurpleAccent,
            border: Border.all(color: ColorConstant.colorAccent, width: 2),
          ),
          child: Center(
            child: Text("N",
                textAlign: TextAlign.center, style: TextStyles.textStyleLogin),
          ),
        ),
      ),
    );
  }
}
