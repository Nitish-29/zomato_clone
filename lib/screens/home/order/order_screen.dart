import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zomato_clone/screens/home/app_bar.dart';
import 'package:zomato_clone/screens/home/model/restaurant_list.dart';
import 'package:zomato_clone/screens/home/order/cuisines_list_view.dart';
import 'package:zomato_clone/screens/home/order/top_offers.dart';
import 'package:zomato_clone/screens/home/restaurant_list.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen> {
  final List<RestaurantRestaurant> _items = <RestaurantRestaurant>[];
  int viewType = 0;
  final RefreshController _refreshController = RefreshController();

  Future<void> _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 5));
    readJson();
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    _items.clear();
    final String response =
        await rootBundle.loadString('assets/json/restaurant.json');
    final data = await json.decode(response);
    setState(() {
      final restuarantData = data[0];
      for (final dynamic data
          in restuarantData["restaurants"] as List<dynamic>) {
        _items.add(RestaurantRestaurant.fromJson(
            data["restaurant"] as Map<String, dynamic>));
      }
    });
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 10), (Timer t) {
      setState(() {
        viewType++;
      });
    });
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(DimenConstant.appBarSize),
        child: AddressAppBar(),
      ),
      body: SmartRefresher(
        enablePullUp: true,
        header: const WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildOfferLayout(),
              _buildCategoryLayout(),
              _buildCuisines(),
              _buildRestaurantText(),
              _buildLRestaurantList(),
            ],
          ),
        ),
      ),
    );
  }

  LazyLoadScrollView _buildLRestaurantList() {
    final RestaurantList orderRestaurantList = RestaurantList();
    return LazyLoadScrollView(
      onEndOfPage: () {},
      child: ListView.builder(
        itemCount: (_items.length / 10).round(),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return orderRestaurantList.restaurantTile(
              _items[index], context, viewType);
        },
      ),
    );
  }

  Container _buildCuisines() {
    return Container(
      margin: DimenConstant.marginTop_10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: DimenConstant.marginAll_16,
            child: Text(StringConstant.textCategoryMsg,
                style: TextStyles.textStyleOrderInfo),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(DimenConstant.dimen_8, 0,
                DimenConstant.dimen_8, DimenConstant.dimen_8),
            child: SizedBox(
                height: DimenConstant.dimen_300, child: CuisinesListView()),
          ),
        ],
      ),
    );
  }

  Padding _buildRestaurantText() {
    return Padding(
      padding: DimenConstant.marginAll_16,
      child: Text("${_items.length} restaurants near you",
          style: TextStyles.textStyleOrderInfo),
    );
  }

  Container _buildCategoryLayout() {
    return Container(
      margin: DimenConstant.marginTop_10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildCategoryTypeItem(
              ColorConstant.colorLightRed,
              ColorConstant.colorAccent,
              MdiIcons.crownOutline,
              StringConstant.textProPartners),
          _buildCategoryTypeItem(
              ColorConstant.colorLightPurple,
              ColorConstant.colorPurple,
              MdiIcons.sackPercent,
              StringConstant.textGreatOffer),
          _buildCategoryTypeItem(
              ColorConstant.colorLightGreen,
              ColorConstant.colorGreen,
              MdiIcons.leaf,
              StringConstant.textPureVeg),
          _buildCategoryTypeItem(
              ColorConstant.colorLightYellow,
              ColorConstant.colorYellow,
              MdiIcons.star,
              StringConstant.textRating),
          _buildCategoryTypeItem(
              ColorConstant.colorLightBLue,
              ColorConstant.colorBlue,
              MdiIcons.heartPlus,
              StringConstant.textMaxSafety),
        ],
      ),
    );
  }

  Column _buildCategoryTypeItem(
      Color backgroundColor, Color iconColor, IconData icon, String title) {
    return Column(
      children: <Widget>[
        _categoryTypeImageView(backgroundColor, icon, iconColor),
        _categoryTypeTextView(title)
      ],
    );
  }

  Padding _categoryTypeTextView(String title) {
    return Padding(
      padding: DimenConstant.marginTop_8,
      child: Center(
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleCategoriesName),
      ),
    );
  }

  Center _categoryTypeImageView(
      Color backgroundColor, IconData icon, Color iconColor) {
    return Center(
      child: Container(
        width: DimenConstant.dimen_40,
        height: DimenConstant.dimen_40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Center(
          child: Icon(icon, color: iconColor),
        ),
      ),
    );
  }

  Container _buildOfferLayout() {
    return Container(
      height: DimenConstant.dimen_240,
      padding: DimenConstant.marginAll_8,
      child: const TopOffers(),
    );
  }
}
