import 'package:flutter/material.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';

class DashedLinePainter extends CustomPainter {
  Paint _paint = Paint();

  DashedLinePainter() {
    _paint = Paint();
    _paint.color = ColorConstant.colorGrey; //dots color
    _paint.strokeWidth = 0.4; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 15) {
      // 15 is space between dots
      if (i % 3 == 0)
        canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
