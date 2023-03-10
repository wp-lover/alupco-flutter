import 'dart:convert';
import 'dart:math';
import 'package:alupco/screen-parts/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../ManageState/pendingOrdersState.dart';

class PendingOrders extends StatelessWidget {
  //

  late PendingOrdersState logic;

  PendingOrders() {
    logic = Get.put(PendingOrdersState());

    logic.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      body: Obx(
        () {
          print(logic.data.length);
          return logic.loading == true
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: itemsBuilder(),
                );
        },
      ),
    );
  }

  Widget item({required int index}) {
    // int orderID = logic.items[0]["order_id"];

    List items;
    List<Widget> uiItems = [];

    var length = jsonDecode(logic.data[index]["data"]);

    uiItems.add(cardHeader(index));

    for (var element in length) {
      print(element["item_code"]);
      uiItems.add(cardBody(element));
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 15.00),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: uiItems),
        ),
      ),
    );
  }

  Widget cardHeader(index) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("SQ # "),
      Row(children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {},
          child: const Text("Confirm", style: TextStyle(color: Colors.black)),
        ),
        const SizedBox(
          width: 20.00,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellowAccent),
          onPressed: () {},
          child: const Text("Edit", style: TextStyle(color: Colors.black)),
        ),
        const SizedBox(
          width: 20.00,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {},
          child: const Text("Delete", style: TextStyle(color: Colors.black)),
        ),
        const SizedBox(
          width: 20.00,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {},
          child: const Text("Print", style: TextStyle(color: Colors.white)),
        ),
      ]),
    ]);
  }

  Widget cardBody(Map<String, dynamic> item) {
    return Row(
      children: [
        Text("Item-Code: ${item["item_code"]}"),
      ],
    );
  }

  Widget itemsBuilder() {
    List<Widget> items = [];

    for (var i = 0; i < logic.data.length; i++) {
      items.add(item(index: i));
    }
    return Column(
      children: items,
    );
  }
  //
}


//  ListView.builder(
//                   itemBuilder: (context, index) {
//                     return ListView(
//                       children: [items(index: index)],
//                     );
//                   },
//                   itemCount: logic.data.length,
//                 );