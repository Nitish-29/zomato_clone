import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:zomato_clone/screens/profile/profile_app_bar.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(175),
        child: ProfileAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildProfileRow,
            _buildDivider(DimenConstant.marginAll_16),
            _buildRatingRow(),
            _buildDivider(DimenConstant.marginAll_16),
            _zomatoProContainer(),
            _zomatoFoodAndGroceryContainer(),
            _zomatoNutritiousOrderContainer(),
            _zomatoTableBookingContainer(),
            _zomatoAboutContainer(),
            _buildTextVIew(StringConstant.textSendFeedback),
            _buildTextVIew(StringConstant.textReportSafety),
            _buildTextVIew(StringConstant.textRateUs),
            _buildTextVIew(StringConstant.textLogout),
            const SizedBox(height: DimenConstant.dimen_80)
          ],
        ),
      ),
    );
  }

  Row get _buildProfileRow {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildProfileItems(
            Icons.bookmark_border_outlined, StringConstant.textBookmarks),
        buildProfileItems(
            Icons.notifications_none, StringConstant.textNotificaitons),
        buildProfileItems(Icons.settings_outlined, StringConstant.textSettings),
        buildProfileItems(Icons.payment, StringConstant.textPayment),
      ],
    );
  }

  Column _zomatoProContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _textHeader(StringConstant.textZomatoPro),
        const SizedBox(height: DimenConstant.dimen_10),
        _buildProfileSettingRows(MdiIcons.accountSettingsOutline,
            StringConstant.textRenewMembership),
        _buildProfileSettingRows(
            Icons.timelapse_outlined, StringConstant.textProHistory),
        _buildProfileSettingRows(
            Icons.chat_rounded, StringConstant.textProHelp),
        _buildDivider(DimenConstant.marginLTRB_1601616),
      ],
    );
  }

  Column _zomatoNutritiousOrderContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _textHeader("NUTRITION ORDER"),
        const SizedBox(height: DimenConstant.dimen_10),
        _buildProfileSettingRows(MdiIcons.cartOutline, "Your Orders"),
        _buildProfileSettingRows(Icons.chat_outlined, "Nutrition Help"),
        _buildDivider(DimenConstant.marginLTRB_1601616),
      ],
    );
  }

  Column _zomatoTableBookingContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _textHeader("TABLE BOOKINGS"),
        const SizedBox(height: DimenConstant.dimen_10),
        _buildProfileSettingRows(MdiIcons.cartVariant, "Your Booking"),
        _buildProfileSettingRows(Icons.chat_outlined, "Table Reservation Help"),
        _buildDivider(DimenConstant.marginLTRB_1601616),
      ],
    );
  }

  Column _zomatoAboutContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildProfileSettingAboutRows(
            Icons.info_outline,
            "About",
            const EdgeInsets.only(
                left: DimenConstant.dimen_10, bottom: DimenConstant.dimen_10)),
        _buildDivider(DimenConstant.marginLTRB_1601616),
      ],
    );
  }

  Column _zomatoFoodAndGroceryContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _textHeader("FOOD AND GROCERY ORDERS"),
        const SizedBox(height: DimenConstant.dimen_10),
        _buildProfileSettingRows(MdiIcons.cartOutline, "Your Orders"),
        _buildProfileSettingRows(MdiIcons.heartOutline, "Favorite Orders"),
        _buildProfileSettingRows(MdiIcons.bookAccountOutline, "Address Book"),
        _buildProfileSettingRows(Icons.chat_outlined, "Online Ordering Help"),
        _buildDivider(DimenConstant.marginLTRB_1601616),
      ],
    );
  }

  Padding _buildProfileSettingRows(IconData iconData, String text) {
    return Padding(
      padding: DimenConstant.marginAll_10,
      child: Row(
        children: <Widget>[
          Container(
            width: DimenConstant.dimen_40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstant.colorlightGrey2,
            ),
            child: Icon(iconData, size: DimenConstant.dimen_20),
          ),
          Container(
              margin: DimenConstant.marginLeft_10,
              child: Text(text, style: TextStyles.textStyleRestaurantName)),
        ],
      ),
    );
  }

  Padding _buildProfileSettingAboutRows(
      IconData iconData, String text, EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Container(
            width: DimenConstant.dimen_40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstant.colorlightGrey2,
            ),
            child: Icon(iconData, size: DimenConstant.dimen_20),
          ),
          Container(
              margin: DimenConstant.marginLeft_10,
              child: Text(text, style: TextStyles.textStyleRestaurantName)),
        ],
      ),
    );
  }

  Container _buildTextVIew(String text) {
    return Container(
        margin: const EdgeInsets.only(
            left: DimenConstant.dimen_16, top: DimenConstant.dimen_16),
        child: Text(text, style: TextStyles.textStyleRestaurantName));
  }

  Container _textHeader(String text) {
    return Container(
      margin: DimenConstant.marginLeft_16,
      child: Text(text, style: TextStyles.textStyleCuisineNames),
    );
  }

  Padding _buildRatingRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          DimenConstant.dimen_10, 0, DimenConstant.dimen_10, 0),
      child: Row(
        children: <Widget>[
          _buildProfileSettingAboutRows(
              Icons.star_border, "Your Rating", const EdgeInsets.all(0)),
          _ratingText
        ],
      ),
    );
  }

  Expanded get _ratingText {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: DimenConstant.dimen_50,
          decoration: const BoxDecoration(
            color: ColorConstant.colorlightGrey2,
            borderRadius: DimenConstant.radius_5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("4.93", style: TextStyles.textStyleResuatrant),
              const Icon(
                Icons.star,
                size: DimenConstant.dimen_14,
                color: ColorConstant.colorYellow,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildDivider(EdgeInsetsGeometry margin) {
    return Container(
      margin: margin,
      child: const Divider(
        height: 0.5,
        color: ColorConstant.colorlightGrey,
      ),
    );
  }

  Column buildProfileItems(IconData iconData, String text) {
    return Column(
      children: <Widget>[
        Icon(iconData),
        Text(
          text,
          style: TextStyles.textStyleRestaurantCost,
        )
      ],
    );
  }
}
