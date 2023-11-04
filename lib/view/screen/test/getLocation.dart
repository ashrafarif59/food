
import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/button.dart';
import '../../../widget/textfield.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'GoogleMap.dart';
import 'googleVariables.dart';

class getLocation extends StatefulWidget {
  getLocation({Key? key}) : super(key: key);

  @override
  State<getLocation> createState() => _getLocationState();
}

class _getLocationState extends State<getLocation> {
  GoogleVariable  googleVariable = GoogleVariable();
  TextEditingController locationController = TextEditingController();
  String? Latitude = "1", Longitude = "1";

  List<Location> locations = [];
  List<LatLng> _latlng =[];
  int LocationLength =0;
  List<Marker> addList=[];

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

          addList.add(Marker(markerId: MarkerId((i+1).toString()),
              position: LatLng(locations[i].latitude, locations[i].longitude),
              infoWindow: InfoWindow(
                  title :'Array Position '+location.latitude.toString()+ ' '+location.longitude.toString()
              )
          )
          );

        }

        addList.add(Marker(markerId: MarkerId((locations.length+2).toString()),
            position: LatLng(location.latitude,location.longitude),
            infoWindow: InfoWindow(
                title :'Current Position '+location.latitude.toString()+ ' '+location.longitude.toString()
            )
        )
        );

        _latlng.add(LatLng(location.latitude, location.longitude));

        LocationLength=locations.length +1;
      //  print(_latlng.length/2);

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
                title: 'Google Markel',
                iconName: Icons.arrow_forward,
                width: 65.w,
                height: 5.h,

                onPress: () {
                  CameraPosition _kGooglePlex = CameraPosition(
                    target: LatLng( double.parse(Latitude.toString()),  double.parse(Longitude.toString())),
                    zoom: 14.4746,
                  );

                  // CameraPosition _kGooglePlex = CameraPosition(
                  //   target: LatLng( 32.1876919,  74.1944529),
                  //   zoom: 14.4746,
                  // );
                  List<Marker> addList1=[];
                  List<Marker> _marker=[];

             // for (int i=0; i<=1 ;i++)
             //   {
             //     if (i==0)
             //       {
             //     addList1.add(Marker(markerId: MarkerId(i.toString()),
             //         position: LatLng(32.1876919,  74.1944529),
             //         infoWindow: InfoWindow(
             //             title :'Array Position '
             //         )
             //     )
             //     );
             //       }
             //     else if (i==1) {
             //
             //       {
             //         addList1.add(Marker(markerId: MarkerId((i+1).toString()),
             //             position: LatLng(32.187456, 74.190548),
             //             infoWindow: InfoWindow(
             //                 title :'Second Postision'
             //             )
             //         )
             //         );
             //       }
             //     }
             //   }
              // addList1 = [
              // (Marker(markerId: MarkerId('1'),
              //     position: LatLng(32.1876919,  74.1944529),
              //     infoWindow: InfoWindow(
              //         title :'Current Position '+32.1876919.toString()+ ' '+74.1944529.toString()
              //     )
              // )),
              //   (Marker(markerId: MarkerId('2'),
              //       position: LatLng(32.187456, 74.190548),
              //       infoWindow: InfoWindow(
              //           title :'New Position '+32.1876919.toString()+ ' '+74.1944529.toString()
              //       )
              //   )),
              //
              // ];
                print(addList);
                  _marker.addAll(addList);


                  googleVariable.Latitude=Latitude;
                  googleVariable.Longitude=Longitude;
                  print(_marker);
                  //return;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => googleMap(
                            kGooglePlex:_kGooglePlex,
                            marker: _marker,
                       /*  GoogleList: _latlng,
                          googleListLength: LocationLength,
                            currentLatitude : double.parse(Latitude.toString()),
                            currentLongitude :
                                double.parse(Longitude.toString())*/
                        ),
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
