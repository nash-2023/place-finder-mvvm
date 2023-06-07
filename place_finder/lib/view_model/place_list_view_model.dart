import 'package:flutter/material.dart';
import 'package:place_finder/services/repos.dart';
import 'package:place_finder/view_model/place_view_model.dart';

import '../models/place.dart';

class PlaceListViewModel extends ChangeNotifier {
  Repos _repo;
  PlaceListViewModel({required Repos repo}) : _repo = repo;
  List<PlaceViewModel> places = [];

  void fetchPlacesByKeywordAndPosition(
      String key, double lat, double lng) async {
    List<Place> rslts = await _repo.fetchPlaces(key, lat, lng);
    places = rslts.map((e) => PlaceViewModel(place: e)).toList();
    notifyListeners();
    return;
  }
}

    // print("--------------NAMES--------------");
    // places.forEach((e) {
    //   print(e.name);
    // });
    // print("-----------END OF NAMES----------");