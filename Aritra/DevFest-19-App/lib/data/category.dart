import 'package:devfest19/data/categoryItem.dart';
// import 'package:devfest19/data/item.dart';
class Category {
  int id;
  String name;
  List<CategoryItem> categoryItems;

  Category({this.id, this.name, 
  this.categoryItems
  });

  factory Category.fromJson(Map<String, dynamic> json){

    var list = json['categoryItems'] as List;
    List<CategoryItem> categoryItemsList = list.map((i) => CategoryItem.fromJson(i)).toList();

  return Category(
    id: json['id'],
    name: json['name'],
    categoryItems: categoryItemsList
    );
  }
}