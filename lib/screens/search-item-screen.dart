import 'package:alupco/ManageState/search-item-state.dart';
import 'package:flutter/material.dart';

import '../Network/networking.dart';
import '../widgets/header.dart';
import '../widgets/ItemList.dart';

class SearchItemScreen extends StatelessWidget {
  SearchItemScreen({super.key});

  TextEditingController controller = TextEditingController();

  late SearchItemState logic;
  late Networking net;
  @override
  Widget build(BuildContext context) {
    //
    net = Networking();

    // initiaze the logic
    logic = SearchItemState();

    // return the main widget
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
                  onPressed: () {
                    logic.searchItems();
                    // net.searchItems();
                  },
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
