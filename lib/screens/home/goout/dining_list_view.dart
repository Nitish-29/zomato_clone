import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:zomato_clone/screens/home/goout/goout_screen.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class DiningListView extends StatelessWidget {
  DiningListView({Key? key}) : super(key: key);

  final List<DiningList> diningList = <DiningList>[];

  @override
  Widget build(BuildContext context) {
    createList();
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      body: SafeArea(
        child: GridView.builder(
          itemCount: GoOutScreenState.isExpanded ? diningList.length : 8,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
              childAspectRatio: 1.7 / 2),
          itemBuilder: (BuildContext context, int index) {
            return _buildGridItem(index, diningList[index]);
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(int index, DiningList diningItem) {
    return SizedBox(
      width: DimenConstant.dimen_60,
      height: DimenConstant.dimen_80,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DimenConstant.dimen_8)),
        elevation: 5,
        color: ColorConstant.colorWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(diningItem.image,
                color: diningItem.color, size: DimenConstant.dimen_30),
            Container(
              margin: DimenConstant.marginTop_16,
              child: Center(
                child: Text(diningItem.name,
                    style: TextStyles.textStyleCategoriesName,
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createList() {
    DiningList cuisineItem = DiningList(MdiIcons.tableChair,
        StringConstant.diningName[0], ColorConstant.colorYellow);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(MdiIcons.diamondStone,
        StringConstant.diningName[1], ColorConstant.colorGrey);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(
        MdiIcons.flower, StringConstant.diningName[2], ColorConstant.colorPink);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(
        MdiIcons.crown, StringConstant.diningName[3], ColorConstant.colorRed);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(
        Icons.coffee, StringConstant.diningName[4], ColorConstant.colorBrown);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(MdiIcons.microphoneVariant,
        StringConstant.diningName[5], ColorConstant.colorBlue);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(Icons.local_drink, StringConstant.diningName[6],
        ColorConstant.colorOrange);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(MdiIcons.foodForkDrink,
        StringConstant.diningName[7], ColorConstant.colorLightBLue);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(MdiIcons.foodTurkey, StringConstant.diningName[8],
        ColorConstant.colorLightRed);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(MdiIcons.iceCream, StringConstant.diningName[9],
        ColorConstant.colorLightBLue);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(MdiIcons.heart, StringConstant.diningName[10],
        ColorConstant.colorAccent);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(MdiIcons.leaf, StringConstant.diningName[11],
        ColorConstant.colorDarkGreen);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(MdiIcons.faceProfile,
        StringConstant.diningName[12], ColorConstant.colorLightRed);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(MdiIcons.eggOutline, StringConstant.diningName[13],
        ColorConstant.colorBlack);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(
        MdiIcons.cat, StringConstant.diningName[14], ColorConstant.colorBrown);
    diningList.add(cuisineItem);
    cuisineItem = DiningList(MdiIcons.breadSlice, StringConstant.diningName[15],
        ColorConstant.colorLightPurple);
    diningList.add(cuisineItem);
  }
}

class DiningList {
  IconData image = Icons.card_giftcard_outlined;
  String name = "";
  Color color = ColorConstant.colorBlack;

  DiningList(this.image, this.name, this.color);
}
