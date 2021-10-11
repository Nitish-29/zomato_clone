import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/screens/home/pro/pro_buy_screen.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';

class ZomatoProScreen extends StatefulWidget {
  const ZomatoProScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ZomatoProScreenState();
}

class _ZomatoProScreenState extends State<ZomatoProScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    offset = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 1.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      appBar: AppBar(
        elevation: 0,
        title: Stack(
          children: <Widget>[
            Container(
              color: ColorConstant.colorBackground,
              width: MediaQuery.of(context).size.width,
              height: DimenConstant.dimen_100,
              child: Center(
                child: Image.asset(
                  'assets/images/zomato_pro.jpg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TabBar(
                labelColor: ColorConstant.colorAccent,
                unselectedLabelColor: ColorConstant.colorBlack,
                tabs: <Widget>[
                  Tab(text: '12 months'),
                  Tab(text: '3 months'),
                ],
              ),
              Container(
                height: 700,
                padding: const EdgeInsets.only(bottom: DimenConstant.dimen_120),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: ZomatoProBuyScreen(isTwelveMonths: true),
                    ),
                    Center(
                      child: ZomatoProBuyScreen(isTwelveMonths: false),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
