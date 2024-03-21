import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:route_courses_app/model/firestore_user.dart';
import 'package:route_courses_app/shared/firebase/firestore_helper.dart';

class AuthDataProvider extends ChangeNotifier{
  User? firebaseUser;
  FirestoreUser? firestoreUser;

  void setUsers(User? authUser, FirestoreUser? dataUser){
    firebaseUser = authUser;
    firestoreUser = dataUser;
  }

  bool isUserLoggedIn(){
    if(FirebaseAuth.instance.currentUser == null){
      return false;
    }
    firebaseUser = FirebaseAuth.instance.currentUser;
    return true;
  }

  Future<void> signOut()async{
    firebaseUser = null;
    firestoreUser = null;
    await FirebaseAuth.instance.signOut();
  }

  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser == null){
      return false;
    }
    firebaseUser = FirebaseAuth.instance.currentUser;
    return true;
  }

  Future<void> retrieveDatabaseUserData()async{
    try{
      firestoreUser = await FirestoreHelper.getUser(firebaseUser!.uid);

    }catch(e){
      print(e);
    }
  }
}