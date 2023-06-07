import 'package:place_finder/models/place.dart';
import 'package:place_finder/services/repos.dart';

class FakeApi implements Repos {
  @override
  Future<List<Place>> fetchPlaces(String key, double lat, double lng) {
    return Future(() => [
          Place(
            name: "name 0",
            lat: 50.251255,
            lng: 60.2531225,
            placeID: "place 0",
            photoURL: "www.placeholder.com/200/200",
          ),
          Place(
            name: "name 1",
            lat: 50.251255,
            lng: 60.2531225,
            placeID: "place 1",
            photoURL: "www.placeholder.com/200/200",
          ),
          Place(
            name: "name 2",
            lat: 50.251255,
            lng: 60.2531225,
            placeID: "place 2",
            photoURL: "www.placeholder.com/200/200",
          ),
          Place(
            name: "name 3",
            lat: 50.251255,
            lng: 60.2531225,
            placeID: "place 3",
            photoURL: "www.placeholder.com/200/200",
          ),
        ]);
  }
}
