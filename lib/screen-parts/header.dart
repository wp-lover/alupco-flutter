import 'package:alupco/screens/PendingOrders.dart';
import 'package:alupco/screens/home-screen.dart';
import 'package:alupco/screens/make-order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  Widget body;
  Header({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alupco"),
      ),
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.all(10.00),
          child: Column(children: [
            const SizedBox(height: 50),

            // go to search item screen
            ElevatedButton(
              onPressed: () {
                Get.to(HomeScreen());
              },
              child: const Text("Search Item"),
            ),
            const SizedBox(height: 30.00),

            // go to make order screen
            ElevatedButton(
              onPressed: () {
                Get.to(MakeOrder());
              },
              child: const Text("Make-Order"),
            ),
            const SizedBox(height: 30.00),

            // go to pending orders screen
            ElevatedButton(
              onPressed: () {
                Get.to(PendingOrders());
              },
              child: const Text("Pending-Orders"),
            ),
          ]),
        ),
      ),
      body: body,
    );
  }
}
