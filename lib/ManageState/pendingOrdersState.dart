import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PendingOrdersState extends GetxController {
  String rootUrl = "https://alupco.writteninfo.com/wp-json/gsp/v1/";
  RxList data = [].obs;

  RxList items = [].obs;

  // for ui loading
  RxBool loading = true.obs;

  // get the data from server
  Future<void> getItems() async {
    http.Response response =
        await http.get(Uri.parse("${rootUrl}get-pending-orders"));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      data.value = jsonData["data"];
      loading.value = false;
    }
  }

  void dataProcess() {
    List items = [];

    // for (int i = 0; i < data.length; i++) {}

    // this.items.add(items[0]);

    loading.value = false;
    print(data[0]);

    print(this.data.length);
  }
}
