import 'dart:convert';
import 'package:alupco/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ManageState/pendingOrdersState.dart';

class PendingOrdersScreen extends StatelessWidget {
  //

  late PendingOrdersState logic;

  late ScrollController _controller;

  int cardItemIndex = 0;

  PendingOrders() {
    logic = Get.put(PendingOrdersState());
    _controller = ScrollController();
    logic.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      body: Obx(
        () {
          //
          return logic.loading == true
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(child: itemsBuilder());
        },
      ),
    );
  }

  Widget itemsBuilder() {
    List<Widget> items = [];
// logic.data.length
    for (var i = 0; i < logic.data.length; i++) {
      items.add(CardItem(i));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: items,
    );
  }

  Widget CardItem(int i) {
    //
    List items = jsonDecode(logic.data[i]["data"]);

    //
    int orderID = jsonDecode(logic.data[i]["id"]);

    //
    cardItemIndex = 1;

    //
    List<DataColumn> dataColumn = const [
      DataColumn(label: Text("#")),
      DataColumn(label: Text("Item-Code")),
      DataColumn(label: Text("Unit")),
      DataColumn(label: Text("Required QTY")),
      DataColumn(label: Text("Prepared QTY")),
      DataColumn(label: Text("In Stock QTY")),
      DataColumn(label: Text("Location")),
    ];

    //
    List<DataRow> row = [];

    for (var item in items) {
      row.add(DataRow(cells: [
        DataCell(Text(cardItemIndex.toString())),
        DataCell(Text(item["item_code"])),
        DataCell(Text(item["item_unit"])),
        DataCell(Text(item["required_qty"])),
        DataCell(Text(item["prepared_qty"])),
        DataCell(Text(item["in_stock_qty"])),
        DataCell(Text(item["item_stock_location"])),
      ]));

      //
      cardItemIndex++;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 15.00, left: 10.00, right: 10.00),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.00),
          child: Column(
            children: [
              cardButtons(orderID, items),
              DataTable(columns: dataColumn, rows: row),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardButtons(orderID, var item) {
    //
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("SQ # " + item[0]["order_id"]),
        Row(children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              logic.confirmOrder(orderID);
            },
            child: const Text("Confirm", style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(
            width: 20.00,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            onPressed: () {
              logic.editOrder(orderID);
            },
            child: const Text("Edit", style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(
            width: 20.00,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              logic.deleteOrder(orderID);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(
            width: 20.00,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              logic.print(orderID);
            },
            child: const Text("Print", style: TextStyle(color: Colors.white)),
          ),
        ]),
      ],
    );
  }

  //
}
