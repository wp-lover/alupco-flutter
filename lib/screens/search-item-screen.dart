import 'package:alupco/ManageState/search-item-state.dart';
import 'package:alupco/widgets/MyState.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../Network/networking.dart';
import '../widgets/header.dart';
import '../widgets/ItemList.dart';

class SearchItemScreen extends StatelessWidget {
  SearchItemScreen({super.key});

  TextEditingController _itemCode = TextEditingController();

  late SearchItemState logic;

  @override
  Widget build(BuildContext context) {
    //
    // initiaze the logic
    logic = Get.put(SearchItemState());

    // return the main widget
    return Header(
      body: Container(
        margin: const EdgeInsets.all(10.00),
        padding: const EdgeInsets.all(10.00),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30.00),
            child: TextField(
              controller: _itemCode,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Search Item",
                suffixIcon: IconButton(
                  hoverColor: Colors.lightBlueAccent,
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () async {
                    print("calling...");
                    var data =
                        await logic.searchItems(itemCode: _itemCode.text);
                    if (data != null) {
                      logic.data = data["data"];
                      logic.reBuildListItem();
                      print(data["data"]);
                    } else {
                      print("got somethign");
                    }
                    print("end fun");
                  },
                ),
              ),
            ),
          ),
          Expanded(child: GetBuilder<SearchItemState>(builder: (_) {
            return ItemList(
              load: logic.hasData,
              data: logic.data,
            );
          })),
        ]),
      ),
    );
  }
}
