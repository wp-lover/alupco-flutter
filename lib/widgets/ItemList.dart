import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          child: Card(
            child: Column(children: [
              Row(children: [Text("Item Name:"), Text("Gesket")]),
            ]),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
