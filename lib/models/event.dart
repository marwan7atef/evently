import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/catgory_item.dart';

class Event{
  String id;
  String userId;
  String title;
  String description;
  DateTime date;
  CatgoryItem catgoryItem;
  Event({
     this.id="",
    required this.title,
    required this.description,
    required this.catgoryItem,
    required this.date,
    required this.userId


});
  Event.fromJson(Map<String,dynamic> json):this(
    id: json["id"],
    userId: json["userId"],
    title: json["title"],
    description: json["description"],
    date: (json["timeStamp"]as Timestamp).toDate(),
    catgoryItem: CatgoryItem.catgorys.firstWhere((element) => element.id==json["catgoryId"],),

  );
  Map<String,dynamic>toJson()=>{
    "id":id,
    "userId":userId,
    "title":title,
    "description":description,
    "timeStamp":Timestamp.fromDate(date),
    "catgoryId":catgoryItem.id



  };



}