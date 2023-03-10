import 'package:alupco/ManageState/pendingOrdersState.dart';
import 'package:alupco/screen-parts/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakeOrder extends StatelessWidget {
  //
  TextEditingController CodeController = TextEditingController();

  TextEditingController IDControler = TextEditingController();

  TextEditingController QTYControler = TextEditingController();

  MakeOrder({super.key});

  //
  var whName;

  @override
  Widget build(BuildContext context) {
    return Header(
      body: Container(
        margin: const EdgeInsets.all(20.00),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.all(10),
            child: DropdownButton(
              hint: const Padding(
                  child: Text("Select W/H Name"),
                  padding: EdgeInsets.all(8.00)),
              value: whName,
              items: getWHlist(),
              onChanged: (value) {
                whName = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.00),
            child: TextField(
              controller: IDControler,
              decoration: const InputDecoration(
                labelText: "SQ or DC-Note",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.00),
            padding: const EdgeInsets.all(0.00),
            child: TextField(
              controller: CodeController,
              decoration: const InputDecoration(
                labelText: "Item-code",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.00),
            child: TextField(
              controller: QTYControler,
              decoration: const InputDecoration(
                labelText: "Quantity",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.00, right: 20.00),
                child: DropdownButton(
                  hint: const Padding(
                      child: Text("Select Unit"),
                      padding: EdgeInsets.all(8.00)),
                  value: whName,
                  items: getWHlist(),
                  onChanged: (value) {
                    whName = value;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.00),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Submit Order"),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  List<DropdownMenuItem<Object>> getWHlist() {
    return [
      DropdownMenuItem(
        child: Text("company-11"),
        value: "company-11",
      ),
      DropdownMenuItem(
        child: Text("company-12"),
        value: "company-12",
      ),
      DropdownMenuItem(
        child: Text("company-13"),
        value: "company-13",
      ),
      DropdownMenuItem(
        child: Text("company-16"),
        value: "company-16",
      )
    ];
  } // getWHlist
}
