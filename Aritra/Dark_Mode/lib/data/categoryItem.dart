class CategoryItem {
  int id;
  String name;
  CategoryItem({this.id, this.name});
  factory CategoryItem.fromJson(Map<String, dynamic> json){
  return CategoryItem(
    id: json['id'],
    name: json['name'],
    );
  }
}