import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';

class TextStyles {
  static TextStyle textStyleAddress = GoogleFonts.lato(
      fontSize: DimenConstant.text_16, fontWeight: FontWeight.bold);

  static TextStyle textStyleName = GoogleFonts.lato(
      fontSize: DimenConstant.text_14, color: ColorConstant.colorWhite);

  static TextStyle textStyleOrderInfo = GoogleFonts.lato(
      fontSize: DimenConstant.text_18, color: ColorConstant.colorBlack);

  static TextStyle textStyleResuatrant = GoogleFonts.lato(
      fontSize: DimenConstant.text_14, color: ColorConstant.colorBlack);

  static TextStyle textStyleCuisineNames = GoogleFonts.lato(
      fontSize: DimenConstant.text_14, color: ColorConstant.colorGrey);

  static TextStyle textStyleCategoriesName =
      GoogleFonts.lato(fontSize: DimenConstant.text_12);

  static TextStyle textStyleDiscount = GoogleFonts.lato(
      fontSize: DimenConstant.text_12, color: ColorConstant.colorWhite);

  static TextStyle textStyleRestaurantName = GoogleFonts.lato(
      fontSize: DimenConstant.text_16, color: ColorConstant.colorBlack);

  static TextStyle textStyleRestaurantCuisines = GoogleFonts.lato(
      fontSize: DimenConstant.text_12, color: ColorConstant.colorGrey);

  static TextStyle textStyleRating = GoogleFonts.lato(
      fontSize: DimenConstant.text_14, color: ColorConstant.colorWhite);

  static TextStyle textStyleRestaurantCost = GoogleFonts.lato(
      fontSize: DimenConstant.text_14, color: ColorConstant.colorBlack);

  static TextStyle textStyleRestaurantSafety = GoogleFonts.lato(
      fontSize: DimenConstant.text_11, color: ColorConstant.colorGrey);

  static TextStyle textStyleLocation = GoogleFonts.lato(
      fontSize: DimenConstant.text_14, color: ColorConstant.colorRed);

  static TextStyle textStylePro = GoogleFonts.lato(
      fontSize: DimenConstant.text_18,
      color: ColorConstant.colorWhite,
      fontWeight: FontWeight.bold);

  static TextStyle textStyleFreeDelivery = GoogleFonts.lato(
      fontSize: DimenConstant.text_14, color: ColorConstant.colorDarkRed);

  static TextStyle textStyleProMember = GoogleFonts.lato(
      fontSize: DimenConstant.text_20,
      color: ColorConstant.colorBlack,
      fontWeight: FontWeight.bold);

  static TextStyle textStyleInvite = GoogleFonts.lato(
      fontSize: DimenConstant.text_12, color: ColorConstant.colorWhite);

  static TextStyle textStyleProDelivery = GoogleFonts.lato(
      fontSize: DimenConstant.text_18, color: ColorConstant.colorWhite);

  static TextStyle textStyleAppName = GoogleFonts.portLligatSans(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: const Color(0xffe46b10),
  );

  static TextStyle textStyleAppTitle = GoogleFonts.lato(
      fontSize: DimenConstant.text_30,
      color: ColorConstant.colorBlack,
      fontWeight: FontWeight.bold);

  static TextStyle textStyleAppTitle2 = GoogleFonts.portLligatSans(
    fontSize: DimenConstant.text_30,
    fontWeight: FontWeight.w700,
    color: const Color(0xffe46b10),
  );

  static TextStyle textStyleLogin = GoogleFonts.lato(
      fontSize: DimenConstant.text_18,
      color: ColorConstant.colorWhite,
      fontWeight: FontWeight.bold);

  static TextStyle textStyleViewActivity = GoogleFonts.lato(
    fontSize: DimenConstant.text_14,
    fontWeight: FontWeight.w700,
    color: ColorConstant.colorRed,
  );

  static TextStyle textFacebookLogin = GoogleFonts.lato(
      color: ColorConstant.colorBlack, fontSize: DimenConstant.text_18);

  static TextStyle textStyleFilterName = GoogleFonts.lato(
      fontSize: DimenConstant.text_12, color: ColorConstant.colorBlack);

  static TextStyle textStyleLoginLabel = GoogleFonts.lato(
      fontSize: DimenConstant.text_16, color: ColorConstant.colorBlue);

  static TextStyle textStyleLoginHint = GoogleFonts.lato(
      fontSize: DimenConstant.text_14, color: ColorConstant.colorGrey);
}
