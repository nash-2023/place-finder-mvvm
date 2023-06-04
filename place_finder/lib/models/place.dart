class Place {
  final String name;
  final double lat;
  final double lng;
  final String placeID;
  final String photoURL;

  Place({
    required this.name,
    required this.lat,
    required this.lng,
    required this.placeID,
    required this.photoURL,
  });

  factory Place.fromJson(Map<String, dynamic> jsn) {
    final location = jsn["geometry"]["location"];
    return Place(
      placeID: jsn["place_id"],
      lat: location["lat"],
      lng: location["lng"],
      name: jsn["name"],
      photoURL: jsn["photos"][0]["photo_reference"],
    );
  }
}
