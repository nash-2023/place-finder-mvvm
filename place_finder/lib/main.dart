import 'package:flutter/material.dart';
import 'package:place_finder/pages/home_page.dart';
import 'package:place_finder/services/webservice.dart';
import 'package:place_finder/view_model/place_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<PlaceListViewModel>(
        create: (context) => PlaceListViewModel(repo: WebService()),
        child: const HomePage(),
      ),
      // home: HomeBeta(),
    );
  }
}
