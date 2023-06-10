import 'package:flutter/material.dart';
import 'package:place_finder/util/url_helper.dart';
import 'package:place_finder/view_model/place_view_model.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});

  final List<PlaceViewModel> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];

        return ListTile(
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
