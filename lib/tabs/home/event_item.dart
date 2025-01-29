import 'package:evently/app_theam.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/event.dart';

class EventItem extends StatelessWidget {
Event event;
EventItem({required this.event});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle=Theme.of(context).textTheme;
    Size sizeScreen=MediaQuery.sizeOf(context);
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        
        child: Stack(
          children: [
            Image.asset("assets/images/${event.catgoryItem.imageOfCat}.png",
            width: double.infinity,
              height: sizeScreen.height*.25,
              fit: BoxFit.fill,
            ),
            Container(
              margin: EdgeInsets.only(left: 8,top: 8),
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 14),
              decoration: BoxDecoration(
                color: AppThem.white,
                borderRadius: BorderRadius.circular(16)

              ),
              child: Column(
                children: [
                  Text("${event.date.day}",style: textStyle.labelMedium?.copyWith(color: AppThem.primary,fontWeight: FontWeight.bold),),
                  SizedBox(height: 2,),
                  Text(DateFormat("MMM").format(event.date),style: textStyle.labelLarge?.copyWith(color: AppThem.primary,fontWeight: FontWeight.bold),)
                  
                ],

              ),

            ),
            Positioned(
              width: sizeScreen.width-32,
              right: 4,
              bottom: 8
              ,
              child: Container(
                margin: EdgeInsets.only(left: 8,top: 8),
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 14),
                decoration: BoxDecoration(
                    color: AppThem.white,
                    borderRadius: BorderRadius.circular(16)

                ),
                child: Row(
                  children: [

                    Expanded(child: Text(event.title,style: textStyle.labelLarge,)),

                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))

                  ],

                ),

              ),
            ),
          ],
        ));
  }
}
