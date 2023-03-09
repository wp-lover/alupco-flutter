import 'package:flutter/material.dart';

import '../screen-parts/header.dart';
import '../widgets/ItemList.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Header(
      body: Container(
        margin: const EdgeInsets.all(10.00),
        padding: const EdgeInsets.all(10.00),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30.00),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Search Item",
                suffixIcon: IconButton(
                  hoverColor: Colors.lightBlueAccent,
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: ItemList(),
            ),
          )
        ]),
      ),
    );
  }
}
