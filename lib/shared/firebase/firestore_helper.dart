import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:route_courses_app/model/firestore_user.dart';

class FirestoreHelper{
  static CollectionReference<FirestoreUser> getUserCollection(){
    var collection = FirebaseFirestore.instance.collection("User").withConverter(
        fromFirestore: (snapshot, options) {
          Map<String,dynamic>? data = snapshot.data();
          return FirestoreUser.fromFirestore(data??{});
        },
        toFirestore: (user, options) {
          return user.toFirestore();
        },
    );
    return collection;
  }

  static Future<FirestoreUser?> getUser(String userID)async{
    var userDoc = getUserCollection().doc(userID);
    var snapshot = await userDoc.get();
    FirestoreUser? user = snapshot.data();
    return user;
  }

  static Future<void> addUser(FirestoreUser user)async{
    var userDoc = getUserCollection().doc(user.id);
    await userDoc.set(user);
  }
}