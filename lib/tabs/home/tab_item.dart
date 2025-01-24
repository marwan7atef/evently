import 'package:evently/app_theam.dart';
import 'package:evently/models/catgory_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
CatgoryItem catgoryItem;
bool isSelected;
TabItem({required this.isSelected,required this.catgoryItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
      color: isSelected?AppThem.white:AppThem.primary,

        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: AppThem.white,width: 1)
      ),
      child: Row(
        children: [
          Icon(catgoryItem.icon,color:isSelected?AppThem.primary:AppThem.white,),

          SizedBox(width: 8,),
          Text(catgoryItem.catName,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: isSelected?AppThem.primary:AppThem.white,),),



        ],


      ),



    );
  }
}
