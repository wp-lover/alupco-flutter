import 'package:alupco/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Header(
        menuIcon: false,
        body: Container(
          child: Text("this is the login page"),
        ));
  }
}
