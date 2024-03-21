import 'package:cloud_firestore/cloud_firestore.dart';
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

  static Stream<List<FeaturedCourses>> getAllFeaturedCourses() async*{
    Stream<QuerySnapshot<FeaturedCourses>> queryStream = getFeaturedCoursesCollection().snapshots();
    Stream<List<FeaturedCourses>> query = queryStream.map((querySnapshot) => querySnapshot.docs.map((documents) => documents.data()).toList());
    yield* query;
  }

  static Stream<List<BestSellingCourses>> getAllBestSellingCourses() async*{
    Stream<QuerySnapshot<BestSellingCourses>> queryStream = getBestSellingCoursesCollection().snapshots();
    Stream<List<BestSellingCourses>> query = queryStream.map((querySnapshot) => querySnapshot.docs.map((documents) => documents.data()).toList());
    yield* query;
  }
}