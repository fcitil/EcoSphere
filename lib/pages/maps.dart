import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:location/location.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  Location location = Location();
  Map<MarkerId,Marker> markers = <MarkerId, Marker>{};

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static LatLng _initialPosition ;

  static  LatLng _lastMapPosition = _initialPosition;




  _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      _animateToUser();
    });
  }


  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _addMarker(){
  }

  _animateToUser() async {
    var pos = await location.getLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(pos.latitude,pos.longitude),
      zoom: 17)
    ));
    setState(() {
      _initialPosition = LatLng(pos.latitude,pos.longitude);
    });
  }

  Set<Marker> getMarker(){
    return <Marker> [
      Marker(
        markerId: MarkerId("ddfsd"),
        position: _initialPosition,
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: "deneme"
        )
      )
    ].toSet();
  }

  void initMarker(specify, ID) async {
    var markerIdVal = ID;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(specify['position'][0],specify['position'][1]),
      infoWindow: InfoWindow(
        title: specify['description']
      ),
    );
    setState(() {
      markers[markerId] = marker;

    });
  }

  getMarkerData() async{
    FirebaseFirestore.instance.collection("allpositions").get().then((data){
      if(data.docs.isNotEmpty){
        for(int i=0; i< data.docs.length; i++){
          initMarker(data.docs[i].data, data.docs[i].id);
        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        GoogleMap(
          //markers: getMarker(),
          initialCameraPosition: CameraPosition(
            target: LatLng(32,53),
            zoom: 15
          ),
          onMapCreated: _onMapCreated,
          myLocationButtonEnabled: true,
          mapType: MapType.hybrid,
          compassEnabled: true,
          onCameraMove: _onCameraMove,
         // markers: getMarkerData(),
        ),
        Positioned(
          top: 50,
          right: 0,
          child:
          FlatButton(
            height: 5,
            minWidth: 0,
            child: CircleAvatar(
              backgroundColor: Colors.white30,
              radius: 25,
              child: Icon(
                Icons.my_location,
                color: Colors.black87,
              ),
            ),
            color: Colors.transparent,
            onPressed: _animateToUser,
          ),
        )
      ],
    );
  }

}

