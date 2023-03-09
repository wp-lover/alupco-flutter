import 'package:alupco/screen-parts/header.dart';
import 'package:flutter/material.dart';

class MakeOrder extends StatelessWidget {
  //
  TextEditingController controller = TextEditingController();

  List<DropdownMenuItem<dynamic>>? metuItems = [
    const DropdownMenuItem<String>(child: Text("hello"))
  ];

  MakeOrder({super.key});

  //

  @override
  Widget build(BuildContext context) {
    return Header(
      body: Container(
        margin: const EdgeInsets.all(10.00),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: DropdownButton(
              items: metuItems,
              onChanged: (value) {},
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0.00),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Item-code",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
