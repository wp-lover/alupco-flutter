import 'package:alupco/screens/login-screen.dart';
import 'package:alupco/screens/pending-orders-screen.dart';
import 'package:alupco/screens/search-item-screen.dart';
import 'package:alupco/screens/make-order-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  Widget body;
  bool menuIcon;
  Header({this.menuIcon = true, required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alupco"),
      ),
      drawer: AppDrawer(),
      body: body,
    );
  }

  // Custom Drawer
  Widget AppDrawer() {
    if (menuIcon == false) {
      return const Text("");
    }

    return Drawer(
      child: Container(
        margin: const EdgeInsets.all(10.00),
        child: Column(children: [
          const SizedBox(height: 50),

          // go to search item screen
          ElevatedButton(
            onPressed: () {
              Get.to(LoginScreen());
            },
            child: const Text("Login"),
          ),
          const SizedBox(height: 30.00),

          // go to search item screen
          ElevatedButton(
            onPressed: () {
              Get.to(SearchItemScreen());
            },
            child: const Text("Search Item"),
          ),
          const SizedBox(height: 30.00),

          // go to make order screen
          ElevatedButton(
            onPressed: () {
              Get.to(MakeOrderScreen());
            },
            child: const Text("Make-Order"),
          ),
          const SizedBox(height: 30.00),

          // go to pending orders screen
          ElevatedButton(
            onPressed: () {
              Get.to(PendingOrdersScreen());
            },
            child: const Text("Pending-Orders"),
          ),
        ]),
      ),
    );
  }
}
