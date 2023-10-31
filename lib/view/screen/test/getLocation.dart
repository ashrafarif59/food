import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/button.dart';
import '../../../widget/textfield.dart';

import 'package:geolocator/geolocator.dart';

class getLocation extends StatefulWidget {
   getLocation({Key? key}) : super(key: key);

  @override
  State<getLocation> createState() => _getLocationState();
}

class _getLocationState extends State<getLocation> {
TextEditingController locationController = TextEditingController();
String? Latitude="1" , Longitude="1" ;
  @override
  Widget build(BuildContext context) {


    Future<bool> checkPermission() async{
      bool isEnable;
      LocationPermission permission;

      isEnable = await Geolocator.isLocationServiceEnabled();
      if (!isEnable) { return false;}
      permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.denied)
        {
          permission= await Geolocator.requestPermission();
          if(permission == LocationPermission.denied)
            { return false;}
        }
      if(permission == LocationPermission.deniedForever) {return false;}
      return true;
    }
    getCurrentLocation  () async
    {
      bool isEnabled = await checkPermission();

      if (isEnabled)
        {
          Position location= await Geolocator.getCurrentPosition();
          Latitude = location.latitude.toString();
          Longitude = location.longitude.toString();

          setState(() {
            print(Longitude);
          });

        }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Get Geo Locator',style: TextStyle(color: AppColors.primaryColor),),
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
      ),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h,vertical: 3.h),
      child: Column(
        children: [
          TextfieldCustom(
              label: 'Enter Location',
              hinttext: 'Islamabad ',
              TextController: locationController,
              Keyboardtype: TextInputType.emailAddress,

          ),
          SizedBox(height:3.h),
          PrimaryButton(Titletype:   titleType.OnlyTitle,
              title: 'Get Latitude and Longtitue',
              iconName: Icons.arrow_forward,
              width: 65.w,
              height: 5.h,
              onPress: (){
                getCurrentLocation();
              }
          ),
          Text(Longitude.toString(),style: TextStyle(color: Colors.black),),
          Text(Latitude.toString(),style: TextStyle(color: Colors.black),),
        ],
      ),
    ),
    );
  }
}
