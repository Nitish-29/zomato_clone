import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class CuisinesListView extends StatelessWidget {
  CuisinesListView({Key? key}) : super(key: key);

  final List<CuisineList> cuisinesList = <CuisineList>[];

  @override
  Widget build(BuildContext context) {
    createList();
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      body: SafeArea(
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cuisinesList.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            return _buildGridItem(index, cuisinesList[index]);
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(int index, CuisineList cuisineItem) {
    return Wrap(
      children: <Widget>[
        Container(
          width: DimenConstant.dimen_100,
          height: DimenConstant.dimen_100,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: 5,
            shadowColor: ColorConstant.colorBlue,
            shape: BoxShape.circle,
            child: Image.asset(
              cuisineItem.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin: DimenConstant.marginTop_10,
          child: Center(
            child: Text(
              cuisineItem.name,
              style: TextStyles.textStyleCuisineNames,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  void createList() {
    CuisineList cuisineItem = CuisineList("assets/images/food1.png", "Healthy");
    cuisinesList.add(cuisineItem);
    cuisineItem =
        CuisineList("assets/images/food2.png", StringConstant.cuisinesName[0]);
    cuisinesList.add(cuisineItem);
    cuisineItem =
        CuisineList("assets/images/food3.png", StringConstant.cuisinesName[1]);
    cuisinesList.add(cuisineItem);
    cuisineItem =
        CuisineList("assets/images/food9.png", StringConstant.cuisinesName[2]);
    cuisinesList.add(cuisineItem);
    cuisineItem =
        CuisineList("assets/images/food5.png", StringConstant.cuisinesName[3]);
    cuisinesList.add(cuisineItem);
    cuisineItem =
        CuisineList("assets/images/food6.png", StringConstant.cuisinesName[4]);
    cuisinesList.add(cuisineItem);
    cuisineItem =
        CuisineList("assets/images/food7.png", StringConstant.cuisinesName[5]);
    cuisinesList.add(cuisineItem);
    cuisineItem =
        CuisineList("assets/images/food8.png", StringConstant.cuisinesName[6]);
    cuisinesList.add(cuisineItem);
    cuisineItem =
        CuisineList("assets/images/food2.png", StringConstant.cuisinesName[7]);
    cuisinesList.add(cuisineItem);
    cuisineItem =
        CuisineList("assets/images/food1.png", StringConstant.cuisinesName[8]);
    cuisinesList.add(cuisineItem);
    cuisineItem =
        CuisineList("assets/images/food8.png", StringConstant.cuisinesName[9]);
    cuisinesList.add(cuisineItem);
    cuisineItem =
        CuisineList("assets/images/food9.png", StringConstant.cuisinesName[10]);
    cuisinesList.add(cuisineItem);
  }
}

class CuisineList {
  String image = "";
  String name = "";

  CuisineList(this.image, this.name);
}
