import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/catgory_item.dart';
import 'package:flutter/cupertino.dart';

import '../firebase_service.dart';
import '../models/event.dart';

class EventsProvider with ChangeNotifier {
  List<Event>event=[];
  CatgoryItem? selctedCatgory;
  Future<void>getEvent() async{
    event=await FirebaseService.getEventFromFirestore(selctedCatgory?.id);
    notifyListeners();

  }
  void changeCatgory(CatgoryItem? cat){
  selctedCatgory=cat;
getEvent();

  }
 Future <void> deleteEvent (int selectedEvent)async{
    FirebaseService.deleteEventFromFirestore(event[selectedEvent].id);
    getEvent();


  }
  Future <void> editEvent({required int selectedEvent,required String editedTitle,required String editedDesc,required DateTime editedDate,required String editedCatId})async{
    FirebaseService.editEventFromFirestore(editDocId: event[selectedEvent].id, editedTitle: editedTitle, editedDesc: editedDesc, editedDate:Timestamp.fromDate(editedDate), editedCatId: editedCatId);
getEvent();



  }


}