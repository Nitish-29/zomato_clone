import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';

class GoOutCarousel extends StatefulWidget {
  const GoOutCarousel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GoOutCarouselScreen();
}

class _GoOutCarouselScreen extends State<GoOutCarousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  final List<String> imgList = <String>[
    'assets/images/carousel_1.jpg',
    'assets/images/carousel_3.jpg',
    'assets/images/carousel_4.jpg',
    'assets/images/carousel_5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBackground,
      body: Stack(
        children: <Widget>[
          _carouselSlider(context),
          _carouselInfo,
        ],
      ),
    );
  }

  Align get _carouselInfo {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _carouselRestaurantInfo,
          _dotIndicator,
        ],
      ),
    );
  }

  Row get _dotIndicator {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.asMap().entries.map((MapEntry<int, String> entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: DimenConstant.dimen_8,
            height: DimenConstant.dimen_8,
            margin: const EdgeInsets.symmetric(
                vertical: DimenConstant.dimen_8,
                horizontal: DimenConstant.dimen_5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }

  Container get _carouselRestaurantInfo {
    return Container(
      margin: const EdgeInsets.only(left: DimenConstant.dimen_25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Get 25% off via Zomato Pro",
              style: TextStyles.textStyleProDelivery),
          const SizedBox(height: DimenConstant.dimen_5),
          Text("Spice it", style: TextStyles.textFacebookLogin),
          const SizedBox(height: DimenConstant.dimen_5),
          Text("Book you table now", style: TextStyles.textStyleProDelivery),
        ],
      ),
    );
  }

  CarouselSlider _carouselSlider(BuildContext context) {
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
          height: DimenConstant.dimen_200,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          onPageChanged: (int index, CarouselPageChangedReason reason) {
            setState(() {
              _current = index;
            });
          }),
      items: imgList
          .map((String item) => _carouselImageView(context, item))
          .toList(),
    );
  }

  Container _carouselImageView(BuildContext context, String item) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: DimenConstant.marginLR_16,
      child: ClipRRect(
        borderRadius:
            const BorderRadius.all(Radius.circular(DimenConstant.dimen_8)),
        child: Image.asset(
          item,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
