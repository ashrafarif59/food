import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class googleMap extends StatefulWidget {
  const googleMap({Key? key}) : super(key: key);

  @override
  State<googleMap> createState() => _googleMapState();
}

class _googleMapState extends State<googleMap> {
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  List<Marker> _marker=[];
  List<Marker> addList=
      [
        Marker(markerId: MarkerId('1'),
        position: LatLng(37.42796133580664, -122.085749655962),
        infoWindow: InfoWindow(
          title :'My Position'
        )
        ),
      ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(addList);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('as'),
      ),
      body: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
         onMapCreated: (GoogleMapController controller){
       _controller.complete(controller);
         },
      ),
    );
  }
}
