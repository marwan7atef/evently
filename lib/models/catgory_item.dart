import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatgoryItem{
  String id;
  IconData icon;
  String catName;
  String imageOfCat;
  CatgoryItem({required this.id,required this.catName,required this.icon,required this.imageOfCat});
  static  List<CatgoryItem>catgorys=[
    CatgoryItem(id: "1", catName: "Sport", icon: Icons.sports_tennis, imageOfCat: "sport"),
    CatgoryItem(id: "2", catName: "Birthday", icon:Icons.cake , imageOfCat: "Birthday"),
    CatgoryItem(id: "3", catName: "Meeting", icon: Icons.laptop, imageOfCat: "Meeting"),
    CatgoryItem(id: "4", catName: "Gaming", icon: Icons.gamepad, imageOfCat: "Gaming"),
    CatgoryItem(id: "5", catName: "Eating", icon: Icons.fastfood, imageOfCat: "Eating"),
    CatgoryItem(id: "6", catName: "Holiday", icon: Icons.festival_outlined, imageOfCat: "Holiday"),
    CatgoryItem(id: "7", catName: "Exhibition", icon: Icons.format_paint, imageOfCat: "Exhibition"),
    CatgoryItem(id: "8", catName: "Work Shop", icon: Icons.work_history_outlined, imageOfCat: "Work Shop"),
    CatgoryItem(id: "9", catName: "Book Club", icon: Icons.book_rounded, imageOfCat: "Book Club"),






  ];




}