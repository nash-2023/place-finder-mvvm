import '../models/place.dart';

abstract class Repos {
  Future<List<Place>> fetchPlaces(String key, double lat, double lng);
}
