import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:route_courses_app/model/featured_courses.dart';
import 'package:route_courses_app/model/firestore_user.dart';

import '../../model/best_selling_courses.dart';

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

  static Future<void> addUser(String userID,String name,String email)async{
    var userDoc = getUserCollection().doc(userID);
    await userDoc.set(FirestoreUser(id: userID, name: name, email: email));
  }

  static CollectionReference<BestSellingCourses> getBestSellingCoursesCollection(){
    var collection = FirebaseFirestore.instance.collection("Best Selling Courses").withConverter(
      fromFirestore: (snapshot, options) {
        Map<String,dynamic>? data = snapshot.data();
        return BestSellingCourses.fromFirestore(data??{});
      },
      toFirestore: (course, options) {
        return course.toFirestore();
      },
    );
    return collection;
  }

  static CollectionReference<FeaturedCourses> getFeaturedCoursesCollection(){
    var collection = FirebaseFirestore.instance.collection("Featured Courses").withConverter(
      fromFirestore: (snapshot, options) {
        Map<String,dynamic>? data = snapshot.data();
        return FeaturedCourses.fromFirestore(data??{});
      },
      toFirestore: (course, options) {
        return course.toFirestore();
      },
    );
    return collection;
  }

  static Future<BestSellingCourses?> getBestSellingCourses(String courseID)async{
    var courseDoc = getBestSellingCoursesCollection().doc(courseID);
    var snapshot = await courseDoc.get();
    BestSellingCourses? course = snapshot.data();
    return course;
  }

  static Future<FeaturedCourses?> getFeaturedCourses(String courseID)async{
    var courseDoc = getFeaturedCoursesCollection().doc(courseID);
    var snapshot = await courseDoc.get();
    FeaturedCourses? course = snapshot.data();
    return course;
  }
}