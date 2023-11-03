import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:food/view/screen/test/googleMap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/button.dart';
import '../../../widget/textfield.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class getLocation extends StatefulWidget {
  getLocation({Key? key}) : super(key: key);

  @override
  State<getLocation> createState() => _getLocationState();
}

class _getLocationState extends State<getLocation> {
  TextEditingController locationController = TextEditingController();
  String? Latitude = "1", Longitude = "1";

  List<Location> locations = [];
  List<LatLng> _latlng =[];

  @override
  Widget build(BuildContext context) {
    Future<bool> checkPermission() async {
      bool isEnable;
      LocationPermission permission;

      isEnable = await Geolocator.isLocationServiceEnabled();
      if (!isEnable) {
        return false;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return false;
      }
      return true;
    }

    getCurrentLocation(String Address) async {
      bool isEnabled = await checkPermission();

      if (isEnabled) {
        Position location = await Geolocator.getCurrentPosition();
        Latitude = location.latitude.toString();
        Longitude = location.longitude.toString();

        if (Address.isNotEmpty) {
          try {
            locations = await locationFromAddress(Address);
          } catch (e) {
            locations = [];
          }
        }

        //  locations.add(Latitude);

        print(locations.toString());
        for (int i=0;i<locations.length; i++)
        {
          print(locations[i].longitude.toString());
          print(locations[i].latitude.toString());
          _latlng.add(LatLng(locations[i].latitude, locations[i].longitude));

      }

        _latlng.add(LatLng(location.latitude, location.longitude));

        print(_latlng.length/2);

        setState(() {});
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Geo Locator',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 3.h),
        child: Column(
          children: [
            TextfieldCustom(
              label: 'Enter Location',
              hinttext: 'Islamabad ',
              TextController: locationController,
              Keyboardtype: TextInputType.emailAddress,
            ),
            SizedBox(height: 3.h),
            PrimaryButton(
                Titletype: titleType.OnlyTitle,
                title: 'Get Latitude and Longtitue',
                iconName: Icons.arrow_forward,
                width: 65.w,
                height: 5.h,
                onPress: () {
                  getCurrentLocation(locationController.text);
                }),


            Text(
              Longitude.toString(),
              style: TextStyle(color: Colors.black),
            ),
            Text(
              Latitude.toString(),
              style: TextStyle(color: Colors.black),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text('Longitute ' +
                            locations[index].longitude.toString()),
                        Text('Latitue ' + locations[index].latitude.toString())
                      ],
                    );
                  }),
            ),
            PrimaryButton(
                Titletype: titleType.OnlyTitle,
                title: 'Get Latitude and Longtitue',
                iconName: Icons.arrow_forward,
                width: 65.w,
                height: 5.h,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => googleMap(),
                      ));
                }),
            // FutureBuilder(
            //     future: getCurrentLocation(locationController.text),
            //     builder: (context,snapshot){
            //       return Expanded(
            //         child: ListView.builder(
            //             itemCount: locations.length,
            //             itemBuilder: (context,index)
            //             {return Column(
            //               children: [
            //                 Text('Longitute '+locations[index].longitude.toString()),
            //                 Text('Latitue '+locations[index].latitude.toString())
            //               ],);
            //             }
            //         ),
            //       );
            //     })
          ],
        ),
      ),
    );
  }
}
