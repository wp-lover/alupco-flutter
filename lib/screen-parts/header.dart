import 'package:flutter/material.dart';

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
                  Navigator.pushNamed(context, "/");
                },
                child: const Text("Search Item")),
            const SizedBox(height: 30.00),

            // go to make order screen
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/make-order");
                },
                child: const Text("Make-Order")),
          ]),
        ),
      ),
      body: body,
    );
  }
}
