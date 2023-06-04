class UrlHelper {
  static const String _apiKey = "AIzaSyDC00hpVso1DtGTIzryroiTFpmKddxmmkU";
  static String getUrl(String key, double latt, double lngg) {
    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latt%2C$lngg&radius=1500&type=restaurant&$key=cruise&key=$_apiKey";
  }
}
