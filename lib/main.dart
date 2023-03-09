import 'package:alupco/provider/HomeProvider.dart';
import 'package:alupco/provider/MakeOrderProvider.dart';
import 'package:alupco/screens/home-screen.dart';
import 'package:alupco/screens/make-order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppRootClass());
}

class AppRootClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => HomeProvider()),
        Provider(create: (context) => MakeOrderProvider()),
      ],
      child: MaterialApp(
        routes: {
          "/": (context) => HomeScreen(),
          "/make-order": (context) => MakeOrder(),
        },
      ),
    );
  }
}
