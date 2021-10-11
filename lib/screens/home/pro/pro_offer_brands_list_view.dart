import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';

class ProOfferBrandListView extends StatelessWidget {
  ProOfferBrandListView({Key? key}) : super(key: key);

  final List<CuisineList> cuisinesList = <CuisineList>[];

  @override
  Widget build(BuildContext context) {
    createList();
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      body: SafeArea(
        child: SizedBox(
          height: DimenConstant.dimen_180,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cuisinesList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 140, mainAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return _buildGridItem(index, cuisinesList[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(int index, CuisineList cuisineItem) {
    return Card(
      elevation: 3,
      shadowColor: ColorConstant.colorGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: DimenConstant.radius_10,
      ),
      color: ColorConstant.colorWhite,
      child: Container(
        padding: DimenConstant.marginAll_8,
        child: Image.network(
          cuisineItem.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  void createList() {
    CuisineList cuisineItem = CuisineList(
        "https://brandslogos.com/wp-content/uploads/images/burger-king-logo.png",
        "Healthy");
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://res.cloudinary.com/simpleview/image/upload/v1438123960/clients/grandrapids/file_bcf11a47-7451-464f-8c4d-c9d3e85e9146.png",
        StringConstant.cuisinesName[0]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://vignette1.wikia.nocookie.net/ridiculoushist/images/b/b8/KFC_logo.png",
        StringConstant.cuisinesName[1]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://blogs.delawareonline.com/secondhelpings/files/2011/09/DDO-logo.png",
        StringConstant.cuisinesName[2]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://image.shutterstock.com/z/stock-vector-food-restaurant-logo-icon-264413183.jpg",
        StringConstant.cuisinesName[3]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://res.cloudinary.com/simpleview/image/upload/v1438123960/clients/grandrapids/file_bcf11a47-7451-464f-8c4d-c9d3e85e9146.png",
        StringConstant.cuisinesName[0]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://vignette1.wikia.nocookie.net/ridiculoushist/images/b/b8/KFC_logo.png",
        StringConstant.cuisinesName[1]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://blogs.delawareonline.com/secondhelpings/files/2011/09/DDO-logo.png",
        StringConstant.cuisinesName[2]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://image.shutterstock.com/z/stock-vector-food-restaurant-logo-icon-264413183.jpg",
        StringConstant.cuisinesName[3]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://res.cloudinary.com/simpleview/image/upload/v1438123960/clients/grandrapids/file_bcf11a47-7451-464f-8c4d-c9d3e85e9146.png",
        StringConstant.cuisinesName[0]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://vignette1.wikia.nocookie.net/ridiculoushist/images/b/b8/KFC_logo.png",
        StringConstant.cuisinesName[1]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://blogs.delawareonline.com/secondhelpings/files/2011/09/DDO-logo.png",
        StringConstant.cuisinesName[2]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://image.shutterstock.com/z/stock-vector-food-restaurant-logo-icon-264413183.jpg",
        StringConstant.cuisinesName[3]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://res.cloudinary.com/simpleview/image/upload/v1438123960/clients/grandrapids/file_bcf11a47-7451-464f-8c4d-c9d3e85e9146.png",
        StringConstant.cuisinesName[0]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://vignette1.wikia.nocookie.net/ridiculoushist/images/b/b8/KFC_logo.png",
        StringConstant.cuisinesName[1]);
    cuisinesList.add(cuisineItem);
    cuisineItem = CuisineList(
        "http://image.shutterstock.com/z/stock-vector-food-restaurant-logo-icon-264413183.jpg",
        StringConstant.cuisinesName[3]);
    cuisinesList.add(cuisineItem);
  }
}

class CuisineList {
  String image = "";
  String name = "";

  CuisineList(this.image, this.name);
}
