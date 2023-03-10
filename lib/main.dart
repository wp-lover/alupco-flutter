import 'package:alupco/screens/home-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(AppRootClass());
}

class AppRootClass extends StatelessWidget {
  const AppRootClass({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
