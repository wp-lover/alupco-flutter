import 'package:get/get.dart';

import '../Network/networking.dart';

class SearchItemState extends GetxController with Networking {
  List data = [];

  bool _hasData = false;

  bool get hasData => _hasData;
  // get items
  // getItems

  void reBuildListItem() {
    _hasData = true;
    update();
  }
}
