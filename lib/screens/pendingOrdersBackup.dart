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

  int cardItemIndex = 0;

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

    List<DataCell> tableRowData = [];

    List<DataRow> dataRow = [];

    cardItemIndex = 0;

    var length = jsonDecode(logic.data[index]["data"]);
    tableRowData.clear();
    for (var item in length) {
      // print(element["item_code"]);
      // uiItems.add(table(element));

      tableRowData.add(DataCell(Text("$cardItemIndex")));
      tableRowData.add(DataCell(Text("${item["item_code"]}")));
      tableRowData.add(DataCell(Text("${item["item_unit"]}")));
      tableRowData.add(DataCell(Text("${item["required_qty"]}")));
      tableRowData.add(DataCell(Text("${item["prepared_qty"]}")));
      tableRowData.add(DataCell(Text("${item["in_stock_qty"]}")));
      tableRowData.add(DataCell(Text("${item["item_stock_location"]}")));

      dataRow.add(DataRow(cells: tableRowData));

      // increase the cardItemIndex by 1
      cardItemIndex++;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 15.00),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable(
            columns: tableColumnData(),
            rows: dataRow,
          ),
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

  List<DataColumn> tableColumnData() {
    return const [
      DataColumn(
        label: Text('#'),
      ),
      DataColumn(
        label: Text('Item-Code'),
      ),
      DataColumn(
        label: Text('Unit'),
      ),
      DataColumn(
        label: Text('Required QTY'),
      ),
      DataColumn(
        label: Text('Prepared QTY'),
      ),
      DataColumn(
        label: Text('In Stock QTY'),
      ),
      DataColumn(
        label: Text('Locatoin'),
      ),
    ];
  } // tableColumnData

  Widget tableRow(Map<String, dynamic> item) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text('#'),
        ),
        DataColumn(
          label: Text('Item-Code'),
        ),
        DataColumn(
          label: Text('Unit'),
        ),
        DataColumn(
          label: Text('Required QTY'),
        ),
        DataColumn(
          label: Text('Prepared QTY'),
        ),
        DataColumn(
          label: Text('In Stock QTY'),
        ),
        DataColumn(
          label: Text('Locatoin'),
        ),
      ],
      rows: [
        // row to set the values
        DataRow(cells: [
          DataCell(Text("$cardItemIndex")),
          DataCell(Text("${item["item_code"]}")),
          DataCell(Text("${item["item_unit"]}")),
          DataCell(Text("${item["required_qty"]}")),
          DataCell(Text("${item["prepared_qty"]}")),
          DataCell(Text("${item["in_stock_qty"]}")),
          DataCell(Text("${item["item_stock_location"]}")),
        ]),
      ],
    );
  }

  DataRow tableRowData() {
    return const DataRow(cells: [
      DataCell(Text("Item code")),
    ]);
  }

  Widget itemsBuilder() {
    List<Widget> items = [];

    for (var i = 0; i < 1; i++) {
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
