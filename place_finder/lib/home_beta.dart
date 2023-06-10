import 'package:flutter/material.dart';

class HomeBeta extends StatefulWidget {
  const HomeBeta({super.key});

  @override
  State<HomeBeta> createState() => _HomeBetaState();
}

class _HomeBetaState extends State<HomeBeta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("images/mark.png"),
      ),
    );
  }
}
