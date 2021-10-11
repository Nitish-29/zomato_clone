import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';

class ExtraScreen extends StatefulWidget {
  const ExtraScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _ExtraScreenState createState() => _ExtraScreenState();
}

class _ExtraScreenState extends State<ExtraScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(widget.title,
                style: const TextStyle(fontSize: DimenConstant.text_20,
                    color: ColorConstant.colorBlack)),
            const Text("Coming soon...",
                style: TextStyle(fontSize: DimenConstant.text_16,
                    color: ColorConstant.colorBlack)),
          ],
        ),
      ),
    );
  }
}
