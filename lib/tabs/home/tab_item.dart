import 'package:evently/app_theam.dart';
import 'package:evently/models/catgory_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
CatgoryItem catgoryItem;
bool isSelected;
Color selectedBack;
Color selectedFor;
Color unSelectedFor;
Color unSelectedborder;
TabItem({required this.isSelected,required this.catgoryItem,required this.selectedBack,required this.selectedFor,required this.unSelectedborder,required this.unSelectedFor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
      color: isSelected?selectedBack:Colors.transparent,

        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: isSelected?Colors.transparent:unSelectedborder,width: 1)
      ),
      child: Row(
        children: [
          Icon(catgoryItem.icon,color: isSelected?selectedFor:unSelectedFor,),

          SizedBox(width: 8,),
          Text(catgoryItem.catName,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: isSelected?selectedFor:unSelectedFor,),),



        ],


      ),



    );
  }
}
