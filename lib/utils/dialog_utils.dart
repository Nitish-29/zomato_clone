import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class DialogUtils {
  static void getRequestLocationDialog(
      BuildContext context, Function onOkCLick) {
    final Dialog requestLocation = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DimenConstant.dimen_16)),
      child: SizedBox(
        height: DimenConstant.dimen_280,
        child: Column(
          children: <Widget>[
            Container(
              margin: DimenConstant.marginTop_16,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstant.colorLocationBackground),
                child: Center(
                    child: Icon(Icons.location_on,
                        color: ColorConstant.colorBlue)),
              ),
            ),
            Container(
              margin: DimenConstant.marginTop_16,
              child: Text(StringConstant.textLocationNotEnabled,
                  style: TextStyles.textStyleRestaurantName),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 16, 30, 30),
              child: Center(
                child: Text(
                  StringConstant.textLocationInfo,
                  style: TextStyles.textStyleResuatrant,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
            Container(
              margin: DimenConstant.marginBottom_8,
              child: Divider(
                color: ColorConstant.colorlightGrey,
                height: 0.3,
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                onOkCLick();
              },
              child: Container(
                padding: DimenConstant.marginAll_8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Icon(Icons.gps_fixed_rounded,
                          size: 14, color: ColorConstant.colorAccent),
                    ),
                    Center(
                      child: Container(
                        padding: DimenConstant.marginLeft_10,
                        child: Text(StringConstant.textEnableLocation,
                            style: TextStyles.textStyleLocation),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: DimenConstant.marginAll_8,
                child:
                    Divider(color: ColorConstant.colorlightGrey, height: 0.3)),
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: DimenConstant.marginAll_8,
                  child: Text("Skip for now",
                      style: TextStyles.textStyleRestaurantCuisines),
                )),
          ],
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return requestLocation;
        });
  }
}
