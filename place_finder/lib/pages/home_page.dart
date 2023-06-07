import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../services/fake_api.dart';
import '../services/webservice.dart';
import '../view_model/place_list_view_model.dart';
import '../view_model/place_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  Position? myPosition; //my way
  double? mylat; //my way
  double? mylng; //my way
  Position? azzPosition;

  void _getLocationPermession() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

//my way
/*
  void _determinePosition() async {
    myPosition = await Geolocator.getCurrentPosition();
    mylat = myPosition!.latitude;
    mylng = myPosition!.longitude;
    setState(() {});
    return;
  }
*/
  void _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    azzPosition = await Geolocator.getCurrentPosition();
    mylat = azzPosition!.latitude;
    mylng = azzPosition!.longitude;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(mylat!, mylng!), zoom: 16)));
  }

  Set<Marker> _getPlaceMarkers(List<PlaceViewModel> places) {
    return places
        .map((p) => Marker(
              markerId: MarkerId(p.placeID),
              position: LatLng(p.lat, p.lng),
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: InfoWindow(title: p.name),
            ))
        .toSet();
    // return <Marker>{};
  }

  @override
  void initState() {
    _getLocationPermession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PlaceListViewModel vm = Provider.of<PlaceListViewModel>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: _getPlaceMarkers(vm.places),
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(45.521563, -122.677433),
              zoom: 16,
            ),
          ),
          SafeArea(
            child: TextField(
              onSubmitted: (value) {
                vm.fetchPlacesByKeywordAndPosition(value, mylat!, mylng!);
              },
              decoration: const InputDecoration(
                labelText: "Search Here",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}


// my way
/*

  @override
  void initState() {
    _getLocationPermession();
    _determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PlaceListViewModel vm = Provider.of<PlaceListViewModel>(context);
    return Scaffold(
      body: (myPosition == null)
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: <Widget>[
                GoogleMap(
                  markers: _getPlaceMarkers(vm.places),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(mylat!, mylng!),
                    zoom: 16,
                  ),
                ),
                SafeArea(
                  child: TextField(
                    onSubmitted: (value) {
                      vm.fetchPlacesByKeywordAndPosition(value, mylat!, mylng!);
                    },
                    decoration: const InputDecoration(
                      labelText: "Search Here",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                )
              ],
            ),
    );
  }

 */