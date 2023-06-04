import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:place_finder/models/place.dart';
import 'package:place_finder/util/url_helper.dart';

class WebService {
  static Future<List<dynamic>?> fetchPlaces(double lat, double lng) async {
    List<Place> rslts = [];
    String rowURL = UrlHelper.getUrl("keyword", lat, lng);
    final Uri _url = Uri.parse("$rowURL");
    try {
      final response = await http.get(_url);
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final jsonBody = jsonDecode(response.body);
        final Iterable results = jsonBody["results"];
        // print(jsonBody["results"][0]);
        rslts = results.map((place) => Place.fromJson(place)).toList();
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } catch (e) {
      print(e);
    }
    print(rslts[0].lng);
    return rslts;
  }
}

  
  // static final Uri _url = Uri.parse(
  //     "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522%2C151.1957362&radius=1500&type=restaurant&keyword=cruise&key=AIzaSyDC00hpVso1DtGTIzryroiTFpmKddxmmkU");
