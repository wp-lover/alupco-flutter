import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  //  root url of server-side application

  //
  String apiKey = "true";
  Map<String, String> headers = {
    "api_key": "9gw8dmpw@+6dCWK?d_e% &/+n_u&2Hj`g[cHA#eP@,Is6Jb6vv/z(+NK<:=.5Cw"
  };
  //
  String rootUrl = "https://alupco.writteninfo.com/wp-json/gsp/v1/";

  bool serverStatus = false;

  /// controlling the order for dispatch

  Future<http.Response> getPendingOrders() async {
    http.Response response =
        await http.get(Uri.parse("${rootUrl}get-pending-orders"));

    if (response.statusCode == 200) {
      //
      serverStatus = true;

      //
      return jsonDecode(response.body);
    } else {
      serverStatus = false;
    }
    return response;
  } // getPendingOrders

  Future<http.Response> makeConfirmOrder(int orderID) async {
    http.Response response = await http.get(
        Uri.parse("${rootUrl}confirm-order?order_id=$orderID&api_key=$apiKey"));

    if (response.statusCode == 200) {
      //
      serverStatus = true;

      //
      return jsonDecode(response.body);
    } else {
      serverStatus = false;
    }
    return response;
  } // makeConfirmOrder

  ///
  /// Controling WhareHouse

  Future<dynamic> searchItems(
      {String? itemCode, String? itemName, String? whName}) async {
    //

    if (serverStatus) {
      serverStatus = false;
    }

    http.Response response = await http.get(
        Uri.parse(
            "${rootUrl}search-items?item_code=$itemCode&item_name=$itemName&wh_name=$whName&api_key=1"),
        headers: this.headers);

    if (response.statusCode == 200) {
      // if server response 200 code then should return the data
      serverStatus = true;

      var data = jsonDecode(response.body);

      print("got the data");

      // return data as json formate
      return data;
    } else {
      serverStatus = false;
    }

    return [];
  } // searchItems

  Future<http.Response> editItem(String code) async {
    http.Response response = await http
        .get(Uri.parse("${rootUrl}edit-item?item-code=$code&api-key=$apiKey"));

    if (response.statusCode == 200) {
      //
      serverStatus = true;

      //
      return jsonDecode(response.body);
    } else {
      serverStatus = false;
    }
    return response;
  } // editItem

  // Networkng
}
