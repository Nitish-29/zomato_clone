import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';

class TopOffers extends StatelessWidget {
  const TopOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      body: SafeArea(
        child: Wrap(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildItem(context, 'assets/images/july_offer.jpg'),
                buildItem(context, 'assets/images/deal4.jpeg'),
              ],
            ),
            Padding(
              padding: DimenConstant.marginTop_16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildItem(context, 'assets/images/deal7.png'),
                  buildItem(context, 'assets/images/deal2.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildItem(BuildContext context, String image) {
    return SizedBox(
      height: DimenConstant.dimen_100,
      width: MediaQuery.of(context).size.width / 2.3,
      child: ClipRRect(
        borderRadius: DimenConstant.radius_16,
        child: Image.asset(image, fit: BoxFit.fill),
      ),
    );
  }
}
