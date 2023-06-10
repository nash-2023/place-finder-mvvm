import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_finder/util/url_helper.dart';
import 'package:place_finder/view_model/place_view_model.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places, required this.onSelected});

  final List<PlaceViewModel> places;
  final Function(PlaceViewModel) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];

        return ListTile(
          onTap: () {
            onSelected(place);
          },
          title: Text(place.name),
          leading: Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            width: 75.0,
            height: 100.0,
            child: Image.network(
              UrlHelper.urlForReferenceImage(place.photoURL),
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }
}
