import 'package:alupco/screens/search-item-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Network/authentication.dart';

void main() {
  runApp(AppRootClass());
}

class AppRootClass extends StatelessWidget {
  AppRootClass({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SearchItemScreen(),
    );
  }
}
