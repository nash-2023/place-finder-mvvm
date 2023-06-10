class UrlHelper {
  static const String _apiKey = "AIzaSyDC00hpVso1DtGTIzryroiTFpmKddxmmkU";

  static String getUrl(String key, double latt, double lngg) {
    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latt%2C$lngg&radius=1500&type=restaurant&keyword=$key&key=$_apiKey";
  }

  static String urlForReferenceImage(String photoRefrerenceId) {
    return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$photoRefrerenceId&key=$_apiKey";
  }
}
