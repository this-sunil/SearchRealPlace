import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> marker={};
  GoogleMapController? mapController;
  Completer<GoogleMapController> completer = Completer();
  late CameraPosition _kGooglePlex;
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
fetchLocation() async{

  return  Geolocator.getCurrentPosition().then((value) async{
    List<Placemark> currentLocation=await placemarkFromCoordinates(value.latitude,value.longitude);
    _kGooglePlex=CameraPosition(target:LatLng(value.latitude, value.longitude),zoom: 10);
   setState(() {
     marker.add(Marker(
       markerId: MarkerId("current Location"),
       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
       position:LatLng(value.latitude,value.longitude),
       infoWindow: InfoWindow(
         title: "${currentLocation[0].name},${currentLocation[0].street},${currentLocation[0].country}",
       ),
     ));
     mapController?.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
   });
});
  }
  @override
 void initState(){
  setState((){
    determinePosition();
    _kGooglePlex=const CameraPosition(target:LatLng(18.465526309756843, 73.85412207887859),zoom: 10);
    fetchLocation();
  });
  print(_kGooglePlex.target.latitude);
  super.initState();
}
@override
void dispose(){
    super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
          myLocationButtonEnabled: true,
          zoomGesturesEnabled: true,
          rotateGesturesEnabled: true,
          markers: Set.of(marker),
          scrollGesturesEnabled: true,
          onMapCreated: (GoogleMapController controller)  async{
            completer.complete(controller);
            controller=await completer.future;


           setState(() {
             mapController=controller;
             fetchLocation();
           });



          }
        ),
      ),
    );
  }
}
