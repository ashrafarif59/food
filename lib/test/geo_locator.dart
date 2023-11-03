import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sizer/sizer.dart';

import '../widget/button.dart';
import '../widget/textfield.dart';

class GeoLocationDart extends StatefulWidget {
  const GeoLocationDart({super.key});

  @override
  State<GeoLocationDart> createState() => _GeoLocationDartState();
}

class _GeoLocationDartState extends State<GeoLocationDart> {
  TextEditingController locationController = TextEditingController();

  Future<Position>  getCurrentLocation ()async
  {
    await Geolocator.requestPermission().then((value) {

    }
    ).onError((error, stackTrace) {
      print(error.toString() + 'asdf');
    }
    );
    print( 'asdf');
    return Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Location',style: TextStyle(
          color: AppColors.primaryColor,
        ),
        ),
        centerTitle: true,

      ),
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 2.h ,),
            TextfieldCustom(
              label: 'Location',
              hinttext: 'Enter the Location ',
              TextController: locationController,
              Keyboardtype: TextInputType.text,

            ),

            SizedBox(height: 3.h ,),
            PrimaryButton(Titletype:   titleType.OnlyTitle,
                title: 'Get Result',
                backgroundColor: Colors.black,
                textColor: AppColors.primaryColor,
                iconName: Icons.arrow_forward,
                width: 35.w,
                height: 4.5.h,
                onPress: (){

                  getCurrentLocation().then((value) {
                    print(value.latitude.toString()+" "+value.longitude.toString());
                  }
                  );
                }
            ),
            SizedBox(height: 3.h ,),
            Text('Current Location')
          ],
        ),
      )
      ,
    );
  }
}

