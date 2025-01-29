import 'package:evently/firebase_service.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/tabs/home/event_details.dart';
import 'package:evently/tabs/home/event_item.dart';
import 'package:evently/tabs/home/home_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/event.dart';

class HomeTap extends StatefulWidget {
  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {




  @override
  Widget build(BuildContext context) {
    EventsProvider eventsProvider=Provider.of<EventsProvider>(context);
if(eventsProvider.event.isEmpty) {
 eventsProvider.getEvent();
}
    return Column(

      children: [
        HomeHeader(),
        SizedBox(height: 16,),
        Expanded(
            child:Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: ListView.separated(itemBuilder:(context, index) =>  GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>EventDetails(selectedIndex: index,) ,));
              },
                
                child: EventItem(event:eventsProvider.event[index])), separatorBuilder:(context, index) =>  SizedBox(height: 16,), itemCount: eventsProvider.event.length)) )




      ],


    );
  }
}
