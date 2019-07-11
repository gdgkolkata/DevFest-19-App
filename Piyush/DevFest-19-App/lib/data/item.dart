class Item {
  String id, name;

  Item({this.id, this.name});

  factory Item.fromJson(Map<String, dynamic> json){
  return Item(
    id: json['id'],
    name: json['name']);
  }
}