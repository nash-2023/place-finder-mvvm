import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:place_finder/models/place.dart';
import 'package:place_finder/services/repos.dart';
import 'package:place_finder/util/url_helper.dart';

class WebService implements Repos {
  @override
  Future<List<Place>> fetchPlaces(String key, double lat, double lng) async {
    List<Place> rslts = [];
    String rowURL = UrlHelper.getUrl(key, lat, lng);
    final Uri _url = Uri.parse("$rowURL");
    try {
      final response = await http.get(_url);
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        final Iterable results = jsonBody["results"];
        rslts = results.map((place) => Place.fromJson(place)).toList();
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      print(e);
    }
    print(rslts.length); //-
    // print(rslts[0].lng); //-
    return rslts;
  }
}

  
  // static final Uri _url = Uri.parse(
  //     "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522%2C151.1957362&radius=1500&type=restaurant&keyword=cruise&key=AIzaSyDC00hpVso1DtGTIzryroiTFpmKddxmmkU");
