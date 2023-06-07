import '../models/place.dart';

class PlaceViewModel {
  final Place _place;

  PlaceViewModel({required Place place}) : _place = place;
  get name => _place.name;
  get lat => _place.lat;
  get lng => _place.lng;
  get placeID => _place.placeID;
  get photoURL => _place.photoURL;
}
