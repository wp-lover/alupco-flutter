// ignore: file_names
class ItemsData {
  late String itemName;
  late String itemCode;
  late String itemDescription;
  late String itemUnit;
  late int itemQTY;
  late String itemLocation;

  ItemsData(
      {required this.itemName,
      required this.itemCode,
      required this.itemDescription,
      required this.itemUnit,
      required this.itemQTY,
      required this.itemLocation});

  ItemsData.fromMap(Map<String, dynamic> data) {
    itemName = data["itemName"];
  }
}
