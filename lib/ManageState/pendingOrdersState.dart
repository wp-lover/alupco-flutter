import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Network/networking.dart';

class PendingOrdersState extends GetxController with Networking {
  // rootUrl this the root url of rest api

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

  Future<bool> confirmOrder(int orderId) async {
    //
    http.Response response =
        await http.get(Uri.parse("${rootUrl}confirm-order"), headers: {});

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<bool> editOrder(int orderId) async {
    //
    http.Response response = await http.get(Uri.parse("${rootUrl}edit-order"));

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<bool> deleteOrder(int orderId) async {
    //
    http.Response response =
        await http.get(Uri.parse("${rootUrl}delete-order"));

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<bool> print(int orderId) async {
    return false;
  }
  //
}
