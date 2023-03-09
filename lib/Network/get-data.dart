import 'dart:convert';

import 'package:http/http.dart' as http;

class GetData {
//

  List Data = [];
  late http.Response response;

  Future<dynamic> searchItems() async {
    response = await http.get(Uri.parse(""));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }

    return Data;
  } // searchItems

  //
}
