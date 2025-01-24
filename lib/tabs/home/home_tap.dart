import 'package:evently/tabs/home/event_item.dart';
import 'package:evently/tabs/home/home_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        HomeHeader(),
        SizedBox(height: 16,),
        Expanded(
            child:Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: ListView.separated(itemBuilder:(context, index) =>  EventItem(), separatorBuilder:(context, index) =>  SizedBox(height: 16,), itemCount: 10)) )




      ],


    );
  }
}
