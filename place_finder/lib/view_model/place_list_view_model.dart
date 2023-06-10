import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_finder/services/repos.dart';
import 'package:place_finder/view_model/place_view_model.dart';

import '../models/place.dart';

class PlaceListViewModel extends ChangeNotifier {
  final Repos _repo;
  PlaceListViewModel({required Repos repo}) : _repo = repo;
  List<PlaceViewModel> places = [];
  var mapType = MapType.normal;

  void fetchPlacesByKeywordAndPosition(
      String key, double lat, double lng) async {
    List<Place> rslts = await _repo.fetchPlaces(key, lat, lng);
    places = rslts.map((e) => PlaceViewModel(place: e)).toList();
    notifyListeners();
    return;
  }

  void toggleMapType() {
    mapType = (mapType == MapType.normal) ? MapType.satellite : MapType.normal;
    notifyListeners();
  }
}

    // print("--------------NAMES--------------");
    // places.forEach((e) {
    //   print(e.name);
    // });
    // print("-----------END OF NAMES----------");