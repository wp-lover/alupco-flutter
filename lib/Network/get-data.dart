import 'dart:convert';

import 'package:http/http.dart' as http;

class GetData {
//
  String restRoot = "https://alupco.writteninfo.com/wp-json/gsp/v1/";

  Future<http.Response> searchItems() async {
    http.Response response = await http.get(Uri.parse(""));
    return response;
  } // searchItems

  Future<http.Response> getPendingOrders() async {
    http.Response response =
        await http.get(Uri.parse("${restRoot}get-pending-orders"));

    // if (response.statusCode == 200) {
    //   print(response.body);
    //   return jsonDecode(response.body);
    // }
    return response;
  } // searchItems

  //
}
