import 'dart:async';
import 'package:evigenie/service/CurrentLocation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_for_flutter/google_places_for_flutter.dart';
import 'package:provider/provider.dart';
class MapViewPage extends StatefulWidget {
  const MapViewPage({Key? key}) : super(key: key);

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {

  Completer<GoogleMapController> completer=Completer();
  late LatLng target;
  GoogleMapController? mapController;
  Set<Marker> marker={};
  late List<LatLng> routeCords;
  GoogleMapPolyline googleMapPolyline=GoogleMapPolyline(apiKey: "AIzaSyCFEIrn6AL1cAcPrJQmF5a7pfExyp-7Cvk");
  final Set<Polyline> polyline={};
  getPolylinePoints(String origin,String destination) async{
    routeCords=(await googleMapPolyline.getPolylineCoordinatesWithAddress(
        origin: origin,
        destination: destination,
        mode: RouteMode.driving))!;

    setState(() {
      polyline.add(Polyline(polylineId: const PolylineId("route1"),
        points: routeCords,
        width: 2,
        color: Colors.pink,
        startCap: Cap.buttCap,
        endCap: Cap.buttCap,

      ));
    });
  }
  String current="";
  fetchLocation(BuildContext context) async{
    Position position=await Provider.of<CurrentLocation>(context,listen: false).determinePosition();
    setState(() {
      target=LatLng(position.latitude,position.longitude);
      mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: target,zoom: 10)));
    });
  }
  String destination="";
  @override
  void initState() {
    target=const LatLng(18.469481484138594, 73.86397432670049);
    fetchLocation(context);
    super.initState();
  }
  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    //print("Target"+target.toString());
    return Scaffold(
      body: Stack(
          alignment: Alignment.topCenter,
          children: [
            GoogleMap(

              initialCameraPosition: CameraPosition(target: target),
              compassEnabled: true,
              mapType: MapType.normal,
              polylines: polyline,
              rotateGesturesEnabled: true,
              markers: Set.of(marker),
              scrollGesturesEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              onMapCreated: (GoogleMapController controller) async{
                completer.complete(controller);

                mapController=await completer.future;


                setState(() {
                  controller.setMapStyle('[{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#969696"},{"saturation":36},{"lightness":40}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#000000"},{"lightness":16},{"visibility":"on"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]},{"featureType":"administrative.country","elementType":"geometry.stroke","stylers":[{"color":"#606060"}]},{"featureType":"administrative.locality","elementType":"labels.icon","stylers":[{"color":"#9e9e9e"},{"visibility":"simplified"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#8d8d8d"}]},{"featureType":"administrative.province","elementType":"geometry.stroke","stylers":[{"color":"#525252"}]},{"featureType":"landscape","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"landscape","elementType":"geometry.stroke","stylers":[{"color":"#636363"}]},{"featureType":"landscape","elementType":"labels.icon","stylers":[{"saturation":"-100"},{"lightness":"-54"}]},{"featureType":"poi","stylers":[{"saturation":"-100"},{"lightness":"0"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#101010"},{"lightness":21}]},{"featureType":"poi","elementType":"labels.icon","stylers":[{"saturation":"-89"},{"lightness":"-55"}]},{"featureType":"poi","elementType":"labels.text","stylers":[{"visibility":"off"}]},{"featureType":"poi.business","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#453838"},{"visibility":"off"}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#303030"},{"saturation":"-100"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"road.local","elementType":"geometry.stroke","stylers":[{"visibility":"off"}]},{"featureType":"transit","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"transit.station","elementType":"labels.icon","stylers":[{"saturation":"-100"},{"lightness":"-51"},{"visibility":"on"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]}]');
                  print("main data ${target.latitude}");
                 /* controller.animateCamera(CameraUpdate.newCameraPosition(const CameraPosition(
                    target: LatLng(18.469481484138594, 73.86397432670049),
                    zoom: 50,
                  )));*/
                });
              },
            ),
            Positioned(
              bottom: 100,
              right:5,
              child: Card(
                elevation: 5,

                shape: const StadiumBorder(),
                child: IconButton(
                    splashRadius: 25,
                    splashColor: Colors.transparent,
                    icon: const Icon(Icons.location_searching_sharp),onPressed: () async{
                  //fetchLocation(context);
                  //var origin=await placemarkFromCoordinates(target.latitude,target.longitude);

                  setState(() {

                    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((value) async{



                      await placemarkFromCoordinates(value.latitude, value.longitude).then((place){
                        setState(() {
                          current="${place[0].name}, ${place[0].subLocality}, ${place[0].subAdministrativeArea}, ${place[0].postalCode}";
                        });
                      });
                      mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(value.latitude,value.longitude),zoom: 10)));
                      marker.add(
                        Marker(markerId: const MarkerId("1"),
                            flat: true,
                            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
                            infoWindow:InfoWindow(title: "${current}"),
                            position: LatLng(value.latitude,value.longitude)),

                      );

                      //Fluttertoast.showToast(msg: "${value.latitude} and ${value.longitude}");
                    });
                    /*if(destination.isNotEmpty){
                      getPolylinePoints("$origin", destination);
                    }*/
                  });


                }),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              right:20,
              child:
              SearchGooglePlacesWidget(
                placeType: PlaceType.address,
                placeholder: "Search Your location ....",
                radius: 3000000,
                language: 'en',
                strictBounds: true,
                hasClearButton: true,
                iconColor: Colors.black,
                location:target,
                clearIcon: Icons.clear,
                icon: Icons.search,
                apiKey: "AIzaSyCFEIrn6AL1cAcPrJQmF5a7pfExyp-7Cvk",
                onSelected: (Place place) async{
                  final geolocation = await place.geolocation;
                  print("Place Data ${geolocation?.coordinates}");
                  target=geolocation!.coordinates;
                  destination=(place.description)!;
                  setState(() {
                    marker.clear();
                    print("target data $target");

                    marker.add(
                      Marker(markerId: const MarkerId("2"),
                          flat: true,
                          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                          infoWindow: InfoWindow(title: place.description),
                          position: LatLng(target.latitude,target.longitude)),

                    );
                    print("Origin: ${geolocation.coordinates}");
                    print("Destination: ${target}");


                    //getPolylinePoints("${geolocation.coordinates}", "${target}");
                    mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                      target: LatLng(target.latitude,target.longitude),
                      zoom: 18,
                    ),
                    ));
                  });

                }, onSearch: (Place place) async{
                // Navigator.pop(context);
                /* final geolocation = await place.geolocation;*/
                Fluttertoast.showToast(msg:"place data${place.description}");

                // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom




              },

              ),
            ),
            Positioned(
                right: 5,
                bottom: 0,
                child: Column(
                  children: [
                    Card(
                      color:Colors.lightBlue,
                      shape: const StadiumBorder(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(

                            icon: const Icon(Icons.add_circle,color: Colors.white),
                            onPressed: (){
                              setState(() {

                                mapController?.animateCamera(CameraUpdate.zoomIn());
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_circle,color: Colors.white),
                            onPressed: (){
                              setState(() {
                                mapController?.animateCamera(CameraUpdate.zoomOut());
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),

          ]
      ),
    );
  }
}
