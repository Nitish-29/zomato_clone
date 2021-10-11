import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key, required this.hintText}) : super(key: key);

  final String hintText;

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchBox> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimenConstant.dimen_50,
      color: ColorConstant.colorBackground,
      child: Card(
          shadowColor: ColorConstant.colorBlack,
          elevation: 0,
          shape: RoundedRectangleBorder(
              side:
                  const BorderSide(color: ColorConstant.colorGrey, width: 0.5),
              borderRadius: BorderRadius.circular(DimenConstant.dimen_10)),
          color: ColorConstant.colorBackground,
          child: Center(
            child: Row(
              children: <Widget>[
                const Padding(
                  padding: DimenConstant.marginLR_16,
                  child: Icon(
                    CupertinoIcons.search,
                    color: ColorConstant.colorRed,
                  ),
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.black,
                        hintStyle:
                            const TextStyle(fontSize: DimenConstant.text_16),
                        hintText: widget.hintText,
                        border: InputBorder.none),
                  ),
                ),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: DimenConstant.marginRight_16,
                      child: Icon(MdiIcons.sortVariant),
                    ))
              ],
            ),
          )),
    );
  }
}
