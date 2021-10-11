import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zomato_clone/screens/home/extra_screen.dart';
import 'package:zomato_clone/screens/home/order/order_screen.dart';
import 'package:zomato_clone/screens/home/pro/zomato_pro_screen.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';

import 'goout/goout_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final PersistentTabController _controller = PersistentTabController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      body: SafeArea(
        child: _buildPersistentBottomBar(),
      ),
    );
  }

  PersistentTabView _buildPersistentBottomBar() {
    return PersistentTabView(
      context,
      controller: _controller,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.linear,
        duration: Duration(milliseconds: 300),
      ),
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      decoration: const NavBarDecoration(
        borderRadius: DimenConstant.radius_10,
        colorBehindNavBar: ColorConstant.colorWhite,
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() => <Widget>[
        const OrderScreen(),
        const GoOutScreen(),
        const ZomatoProScreen(),
        const ExtraScreen(title: "Nutrition Page"),
        const ExtraScreen(title: "Donate Page")
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() =>
      <PersistentBottomNavBarItem>[
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_bag_outlined),
          title: StringConstant.textOrder,
          activeColorPrimary: ColorConstant.colorAccent,
          inactiveColorPrimary: ColorConstant.colorGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(MdiIcons.shoePrint),
          title: StringConstant.textGoOut,
          activeColorPrimary: ColorConstant.colorAccent,
          inactiveColorPrimary: ColorConstant.colorGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(MdiIcons.crownOutline),
          title: StringConstant.textPro,
          activeColorPrimary: ColorConstant.colorAccent,
          inactiveColorPrimary: ColorConstant.colorGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(MdiIcons.nutrition),
          title: StringConstant.textNutrition,
          activeColorPrimary: ColorConstant.colorAccent,
          inactiveColorPrimary: ColorConstant.colorGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(MdiIcons.walletGiftcard),
          title: StringConstant.textDonate,
          activeColorPrimary: ColorConstant.colorAccent,
          inactiveColorPrimary: ColorConstant.colorGrey,
        ),
      ];
}
