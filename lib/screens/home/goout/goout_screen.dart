import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:zomato_clone/screens/home/app_bar.dart';
import 'package:zomato_clone/screens/home/goout/go_out_carousel.dart';
import 'package:zomato_clone/screens/home/model/restaurant_list.dart';
import 'package:zomato_clone/screens/home/restaurant_list.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

import 'dining_list_view.dart';

class GoOutScreen extends StatefulWidget {
  const GoOutScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GoOutScreenState();
}

class GoOutScreenState extends State<GoOutScreen> {
  final List<RestaurantRestaurant> _items = <RestaurantRestaurant>[];
  static bool isExpanded = false;

  // Fetch content from the json file
  Future<void> readJson() async {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildFilterRow,
            _buildCarousel(context),
            _buildDining(),
            _showMoreBtn(context),
            _buildRestaurantText(),
            _buildRestaurantList(),
          ],
        ),
      ),
    );
  }

  Container get _buildFilterRow {
    return Container(
      margin: DimenConstant.marginLTRB_1601616,
      height: DimenConstant.dimen_40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _filterItemSpan(MdiIcons.sort, " Filters"),
          _filterItemSpan(MdiIcons.crownOutline, " Pro"),
          _filterItem("Book a table"),
          _filterItem("Max Safety"),
          _filterItem("Outdoor Seating"),
          _filterItem("Rating 4.0+"),
          _filterItem("Cuisines \u25BC"),
          _filterItem("Cafes"),
          _filterItem("Open Now"),
        ],
      ),
    );
  }

  Container _filterItemSpan(IconData widgetIcon, String text) {
    return Container(
      height: DimenConstant.dimen_40,
      margin: DimenConstant.marginAll_5,
      padding: DimenConstant.marginLR_8,
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstant.colorlightGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                  child: Icon(widgetIcon, size: 14),
                  style: TextStyles.textStyleFilterName),
              TextSpan(text: text, style: TextStyles.textStyleFilterName),
            ],
          ),
        ),
      ),
    );
  }

  Container _filterItem(String text) {
    return Container(
      height: DimenConstant.dimen_40,
      margin: DimenConstant.marginAll_5,
      padding: DimenConstant.marginLR_16,
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstant.colorlightGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Text(text, style: TextStyles.textStyleFilterName)),
    );
  }

  InkWell _showMoreBtn(BuildContext context) {
    final Container _showMoreButton = Container(
      width: MediaQuery.of(context).size.width,
      height: DimenConstant.dimen_25,
      margin: const EdgeInsets.only(
          left: DimenConstant.dimen_16, right: DimenConstant.dimen_16),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstant.colorlightGrey),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: Text(StringConstant.textMoreBtn(isExpanded),
              style: TextStyles.textStyleRestaurantCuisines)),
    );

    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: _showMoreButton,
    );
  }

  SizedBox _buildCarousel(BuildContext context) {
    return const SizedBox(
      height: DimenConstant.dimen_200,
      child: GoOutCarousel(),
    );
  }

  LazyLoadScrollView _buildRestaurantList() {
    final RestaurantList restaurantList = RestaurantList();
    return LazyLoadScrollView(
      onEndOfPage: () {},
      child: ListView.builder(
        itemCount: (_items.length / 10).round(),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return restaurantList.restaurantTile(_items[index + 20], context, 3);
        },
      ),
    );
  }

  Container _buildDining() {
    return Container(
      margin: DimenConstant.marginTop_10,
      padding: DimenConstant.marginLTRB_8088,
      height: isExpanded ? DimenConstant.dimen_500 : DimenConstant.dimen_240,
      child: DiningListView(),
    );
  }

  Padding _buildRestaurantText() {
    return Padding(
      padding: DimenConstant.marginAll_16,
      child: Text("Popular restaurants near you",
          style: TextStyles.textStyleOrderInfo),
    );
  }
}
