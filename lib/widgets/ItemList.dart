import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  List? data;
  int? index;
  bool load = false;
  ItemList({
    required this.load,
    this.data,
    this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //

    if (load == false) {
      return const Text("from ItemList");
    }

    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15.00),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.00),
              child: Column(children: [
                Row(children: [
                  const Text("Item-Code:"),
                  const SizedBox(width: 8.00),
                  Text("${data![i]["alupco_code"]}")
                ]),
                Row(children: [
                  const Text("Uint:"),
                  const SizedBox(width: 8.00),
                  Text("${data![i]["unit"]}")
                ]),
                Row(children: [
                  const Text("Total Quantity:"),
                  const SizedBox(width: 8.00),
                  Text("${data![i]["total_quantity:"]}")
                ]),
                Row(children: [
                  const Text("Location:"),
                  const SizedBox(width: 8.00),
                  Text("${data![i]["item_location"]}")
                ]),
              ]),
            ),
          ),
        );
      },
      itemCount: data!.length,
    ));
  }
}
