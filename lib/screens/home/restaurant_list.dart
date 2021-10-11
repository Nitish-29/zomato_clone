import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/screens/home/model/restaurant_list.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class RestaurantList {
  Padding restaurantTile(
      RestaurantRestaurant restaurantItem, BuildContext context, int viewType) {
    return Padding(
      padding: DimenConstant.marginAll_8,
      child: Card(
        elevation: 1,
        shadowColor: ColorConstant.colorLightRed,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: ColorConstant.colorlightGrey,
            ),
            borderRadius: BorderRadius.circular(DimenConstant.dimen_16)),
        child: Column(
          children: <Widget>[
            _restaurantImage(restaurantItem, context),
            _restaurantInfo(restaurantItem, context, viewType)
          ],
        ),
      ),
    );
  }

  ClipRRect _restaurantInfo(
      RestaurantRestaurant restaurantItem, BuildContext context, int viewType) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(DimenConstant.dimen_16),
          bottomRight: Radius.circular(DimenConstant.dimen_16)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: DimenConstant.dimen_100,
        child: Container(
          padding: const EdgeInsets.only(
              left: DimenConstant.dimen_8,
              right: DimenConstant.dimen_8,
              top: DimenConstant.dimen_8),
          color: ColorConstant.colorWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _restaurantTitleRow(restaurantItem),
              _restaurantCuisinesRow(restaurantItem),
              const Padding(
                padding: DimenConstant.marginAll_8,
                child: Divider(color: ColorConstant.colorGrey, height: 0.5),
              ),
              if (viewType % 3 == 0)
                _restaurantSafetyInfo3(restaurantItem)
              else if (viewType % 2 == 0)
                _restaurantSafetyInfo2()
              else
                _restaurantSafetyInfo()
            ],
          ),
        ),
      ),
    );
  }

  Row _restaurantSafetyInfo2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: DimenConstant.dimen_20,
          height: DimenConstant.dimen_25,
          child: Image.asset('assets/images/leaves.jpg'),
        ),
        Container(
          margin: DimenConstant.marginLeft_10,
          child: SizedBox(
            width: DimenConstant.dimen_250,
            height: DimenConstant.dimen_25,
            child: Center(
              child: Text(StringConstant.textSafety,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.textStyleRestaurantSafety),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: DimenConstant.dimen_40,
            height: DimenConstant.dimen_20,
            child: Align(
              alignment: Alignment.centerRight,
              child: Center(child: Image.asset('assets/images/max_safety.jpg')),
            ),
          ),
        )
      ],
    );
  }

  Row _restaurantSafetyInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: DimenConstant.dimen_40,
          height: DimenConstant.dimen_25,
          child: Image.asset('assets/images/max_safety.jpg'),
        ),
        Container(
          margin: DimenConstant.marginLeft_10,
          child: SizedBox(
            width: DimenConstant.dimen_250,
            height: DimenConstant.dimen_25,
            child: Center(
              child: Text(StringConstant.textSafety2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.textStyleRestaurantSafety),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: DimenConstant.dimen_25,
            height: DimenConstant.dimen_25,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstant.colorPurple,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.trending_up,
                      size: DimenConstant.dimen_15,
                      color: ColorConstant.colorWhite,
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }

  Container _restaurantSafetyInfo3(RestaurantRestaurant restaurantItem) {
    return Container(
      margin: DimenConstant.marginLeft_10,
      child: SizedBox(
        width: DimenConstant.dimen_250,
        height: DimenConstant.dimen_25,
        child: Center(
          child: Text(
              "${restaurantItem.location?.address} "
              "+ ${restaurantItem.location?.city}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.textStyleRestaurantSafety),
        ),
      ),
    );
  }

  Row _restaurantCuisinesRow(RestaurantRestaurant restaurantItem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: DimenConstant.dimen_200,
          child: Text(restaurantItem.cuisines,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.textStyleRestaurantCuisines),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: DimenConstant.marginRight_10,
            child: Text(
              "${restaurantItem.currency}"
              "${restaurantItem.averageCostForTwo} for two",
              style: TextStyles.textStyleRestaurantCost,
            ),
          ),
        ),
      ],
    );
  }

  Row _restaurantTitleRow(RestaurantRestaurant restaurantItem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: DimenConstant.dimen_250,
          child: Text(restaurantItem.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.textStyleRestaurantName),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: DimenConstant.marginRight_10,
            padding: const EdgeInsets.fromLTRB(
                DimenConstant.dimen_10,
                DimenConstant.dimen_3,
                DimenConstant.dimen_3,
                DimenConstant.dimen_3),
            decoration: BoxDecoration(
                color: ColorConstant.colorDarkGreen,
                borderRadius: BorderRadius.circular(DimenConstant.dimen_5)),
            child: Center(
              child: Text(
                "${restaurantItem.userRating?.aggregateRating} \u2605",
                style: TextStyles.textStyleRating,
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _restaurantImage(
      RestaurantRestaurant restaurantItem, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: DimenConstant.dimen_180,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(DimenConstant.dimen_16),
                topRight: Radius.circular(DimenConstant.dimen_16)),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.png',
              image: restaurantItem.thumb.isNotEmpty
                  ? restaurantItem.thumb
                  : "https://b.zmtcdn.com/data/pictures/9/16608059/c1b5ef4f010414a5aa98ea22e19e3037_featured_v2.jpg",
              width: MediaQuery.of(context).size.width,
              height: DimenConstant.dimen_200,
              fit: BoxFit.fill,
              imageCacheHeight: 150,
              imageCacheWidth: 150,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: DimenConstant.marginBottom_16,
              padding: const EdgeInsets.fromLTRB(
                  DimenConstant.dimen_10,
                  DimenConstant.dimen_3,
                  DimenConstant.dimen_3,
                  DimenConstant.dimen_3),
              decoration: BoxDecoration(
                  color: ColorConstant.colorBlue,
                  borderRadius: BorderRadius.circular(DimenConstant.dimen_5)),
              child: Text(
                StringConstant.textDiscount,
                style: TextStyles.textStyleDiscount,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
