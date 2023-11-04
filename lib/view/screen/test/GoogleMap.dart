import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'googleVariables.dart';




class googleMap extends StatefulWidget {
  /*List<LatLng> GoogleList = [];
  int  googleListLength;*/

  List<Marker> marker=[];
  List<Marker> addList =[];
  CameraPosition kGooglePlex;
   googleMap({Key? key,
   //  ,required this.GoogleList, this.googleListLength=0 ,
     required this.kGooglePlex,
     required this.marker,

   }) : super(key: key);





  @override
  State<googleMap> createState() => _googleMapState();
}

class _googleMapState extends State<googleMap> {

  GoogleVariable  googleVariable = GoogleVariable();

  Completer<GoogleMapController> _controller = Completer();




  @override
  Widget build(BuildContext context) {

    // CameraPosition _kGooglePlex = CameraPosition(
    //     target: LatLng(widget.currentLocation),
    //     double.parse(Longitude.toString())),
    //     zoom: 14.4746,
    // )


    //print(widget.currentLatitude.toString()+' newlog '+widget.currentLongitude.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('as'),
      ),
      body: GoogleMap(
        initialCameraPosition: widget.kGooglePlex,
        markers: Set<Marker>.of(widget.marker ),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}
