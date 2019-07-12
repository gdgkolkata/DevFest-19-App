import 'package:devfest19/data/category.dart';
import 'package:devfest19/data/item.dart';

class Session {
  String id, title, description, startsAt, endsAt, room, roomId;
  List<Item> speakers;
  List<Category> categories;

  Session({this.id, 
  this.title, 
  this.description, 
  this.startsAt, 
  this.endsAt, 
  this.room, 
  this.roomId, 
  this.speakers, 
  //this.categories
  });

  factory Session.fromJson(Map<String, dynamic> json){

     var list1 = json['speakers'] as List;
     List<Item> speakersList = list1.map((i) => Item.fromJson(i)).toList();

    //  var list2 = json['categories'] as List;
    //  List<Category> categoriesList = list2.map((k) => Category.fromJson(k)).toList();

  return Session(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    startsAt: json['startsAt'],
    endsAt: json['endsAt'],
    room: json['room'], 
    roomId: json['roomId'],
    speakers: speakersList,
    //categories: categoriesList
    );
  }

}

