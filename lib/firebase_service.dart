import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService{
  static  CollectionReference<Event>catchEventCollectionFromFirestore()=>FirebaseFirestore.instance.collection("event").withConverter(
    fromFirestore: (snapshot, _) =>Event.fromJson(snapshot.data()!) ,
    toFirestore: (event, _) =>event.toJson() ,);
  static  CollectionReference<UserModel>catchUserCollectionFromFirestore()=>FirebaseFirestore.instance.collection("user").withConverter(
    fromFirestore: (snapshot, _) =>UserModel.fromJson(snapshot.data()!) ,
    toFirestore: (user, _) =>user.toJson() ,);
  static Future<void>addEventToFirebase (Event event)async{
    CollectionReference<Event> collectionReference = catchEventCollectionFromFirestore();
    DocumentReference<Event> doc =collectionReference.doc();
    event.id=doc.id;
    return doc.set(event);



  }
  static Future<List<Event>>getEventFromFirestore(String? catId) async{
    CollectionReference<Event> collectionReference =catchEventCollectionFromFirestore();
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
    CollectionReference<Event> collectionReference =catchEventCollectionFromFirestore();
   return collectionReference.doc(deletedDocId).delete();



  }
  static Future<void>editEventFromFirestore({required String editDocId,required String editedTitle,required String editedDesc,required Timestamp editedDate,required String editedCatId}){
    CollectionReference<Event> collectionReference =catchEventCollectionFromFirestore();
    return collectionReference.doc(editDocId).update({
      "title":editedTitle,
      "description":editedDesc,
      "timeStamp":editedDate,
      "catgoryId":editedCatId,

    });



  }
  static Future<UserModel> register ({required String email,required String password,required String name} )async{
    UserCredential credential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    UserModel user= UserModel(id: credential.user!.uid,email:email ,name:name ,favoriteEventIds:[] );
    CollectionReference<UserModel> collectionReference =catchUserCollectionFromFirestore();
    collectionReference.doc(user.id).set(user);
    return user;





  }
  static Future<UserModel> login({required String email,required String password})async{
    UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    CollectionReference<UserModel> collectionReference =catchUserCollectionFromFirestore();
    DocumentSnapshot<UserModel> documentSnapshot= await collectionReference.doc(credential.user!.uid).get();
    return documentSnapshot.data()!;



}
static Future<void>logout()async{
    FirebaseAuth.instance.signOut();


}




}