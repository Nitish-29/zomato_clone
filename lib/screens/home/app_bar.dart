import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:zomato_clone/utils/constants/color_constant.dart';
import 'package:zomato_clone/utils/constants/dimensions_constant.dart';
import 'package:zomato_clone/utils/constants/string_constant.dart';
import 'package:zomato_clone/utils/constants/text_styles.dart';
import 'package:zomato_clone/utils/dialog_utils.dart';
import 'package:zomato_clone/utils/navigation_controller.dart';

import 'order/search_box.dart';

class AddressAppBar extends StatefulWidget {
  const AddressAppBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppBarScreen();
}

class _AppBarScreen extends State<AddressAppBar> {
  Location location = Location();
  LocationData? locationData;
  String homeAddress = StringConstant.textAddress;

  /// Determine the current position of the device.
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<void> _determinePosition() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData locationD;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      DialogUtils.getRequestLocationDialog(context, () async {
        _serviceEnabled = await location.requestService();
      });

      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationD = await location.getLocation();
    setState(() {
      locationData = locationD;
      _getAddress(locationData!.latitude!, locationData!.latitude!).then(
        (List<Address> value) => {
          setState(() {
            homeAddress = value.first.addressLine!;
          })
        },
      );
    });
  }

  Future<List<Address>> _getAddress(double lat, double lang) async {
    final Coordinates coordinates = Coordinates(lat, lang);
    final List<Address> add =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return add;
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[_buildHeaderRow(), _buildSearchBox()],
      ),
    );
  }

  Padding _buildSearchBox() {
    return Padding(
      padding: DimenConstant.marginAll_8,
      child: SearchBox(hintText: StringConstant.textSearchHint),
    );
  }

  Padding _buildHeaderRow() {
    return Padding(
      padding: DimenConstant.marginAll_8,
      child: Row(
        children: <Widget>[
          const Icon(Icons.location_on, color: ColorConstant.colorAccent),
          _textUserAddress(),
          _buildNameCircleVIew()
        ],
      ),
    );
  }

  Padding _textUserAddress() {
    return Padding(
      padding: DimenConstant.marginLeft_10,
      child: SizedBox(
        width: DimenConstant.dimen_250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Home - $homeAddress",
                overflow: TextOverflow.ellipsis,
                style: TextStyles.textStyleAddress),
            Container(
              margin: DimenConstant.marginTop_1,
              child: const Divider(
                height: 0.5,
                color: ColorConstant.colorGrey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildNameCircleVIew() {
    return Expanded(
      child: Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            NavigationController.navigateToProfile();
          },
          child: Container(
            margin: DimenConstant.marginRight_10,
            width: DimenConstant.dimen_30,
            height: DimenConstant.dimen_30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurpleAccent,
            ),
            child: Center(
              child: Text("N",
                  textAlign: TextAlign.center, style: TextStyles.textStyleName),
            ),
          ),
        ),
      ),
    );
  }
}
