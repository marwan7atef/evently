import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event.dart';

class FirebaseService{
  static  CollectionReference<Event>catchCollectionFromFirestore()=>FirebaseFirestore.instance.collection("event").withConverter(
    fromFirestore: (snapshot, _) =>Event.fromjson(snapshot.data()!) ,
    toFirestore: (event, _) =>event.tojson() ,);
  static Future<void>addEventToFirebase (Event event)async{
    CollectionReference<Event> collectionReference = catchCollectionFromFirestore();
    DocumentReference<Event> doc =collectionReference.doc();
    event.id=doc.id;
    return doc.set(event);



  }
  static Future<List<Event>>getEventFromFirestore(String? catId) async{
    CollectionReference<Event> collectionReference =catchCollectionFromFirestore();
    late QuerySnapshot<Event>querySnapshot;
    if(catId==null) {
   querySnapshot   = await collectionReference.orderBy(
          "timeStamp").get();
    }else{
    querySnapshot = await collectionReference.where("catgoryId",isEqualTo: catId).orderBy(
          "timeStamp").get();
    }
    return querySnapshot.docs.map((snap) =>snap.data() ,).toList();


  }
  static Future<void>deleteEventFromFirestore(String deletedDocId){
    CollectionReference<Event> collectionReference =catchCollectionFromFirestore();
   return collectionReference.doc(deletedDocId).delete();



  }
  static Future<void>editEventFromFirestore({required String editDocId,required String editedTitle,required String editedDesc,required Timestamp editedDate,required String editedCatId}){
    CollectionReference<Event> collectionReference =catchCollectionFromFirestore();
    return collectionReference.doc(editDocId).update({
      "title":editedTitle,
      "description":editedDesc,
      "timeStamp":editedDate,
      "catgoryId":editedCatId,

    });



  }



}