import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:zomato_clone/screens/customui/clip_painter.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 3.5,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                ColorConstant.colorCurve1,
                ColorConstant.colorCurve2
              ],
            ),
          ),
          child: Opacity(
              opacity: 0,
              child: Image.asset("assets/images/login_backgound.png",
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
