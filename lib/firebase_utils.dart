import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testttt/Register/registerScreen.dart';
import 'package:testttt/screens/GameScreen.dart';
import 'package:testttt/screens/community_screen.dart';
import 'package:testttt/screens/home_location_screen.dart';
import 'package:testttt/screens/location_screen.dart';
import 'package:testttt/screens/login_screen.dart';
import 'Home_Screen/Home_Screen.dart';
import 'Home_Screen/LearnAboutPlants.dart';
import 'Home_Screen/Popularplant.dart';
import 'Home_Screen/know_about_plants_screen.dart';
import 'LoginSignup.dart';
import 'Profile/edit_information.dart';
import 'Profile/profileScreen.dart';
import 'search_screen.dart';
import 'firebase_options.dart';
import 'package:testttt/screens/add_plant/add_plant_bottom_sheet.dart';
import 'package:testttt/screens/add_plant/plant_list_item.dart';
import 'package:testttt/screens/add_plant/edit_plant_page.dart';
import 'package:testttt/screens/add_plant/plant_list_tab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testttt/model/plant.dart';
import 'package:testttt/model/my_user.dart';

class FirebaseUtils {

  static CollectionReference<Task> getTasksCollection(String uId){
    return getUsersCollection().doc(uId).collection(Task.collectionName).
    withConverter<Task>(
        fromFirestore: ((snapshot, options) => Task.fromFireStore(snapshot.data()!)),
        toFirestore: (task,options) => task.toFireStore()
    );
  }

  static Future<void> addTaskToFireStore(Task task, String uId){
    var taskCollectionRef = getTasksCollection(uId);     //collection
    DocumentReference<Task> taskDocRef = taskCollectionRef.doc();    //document
    task.id = taskDocRef.id;   //auto id
    return taskDocRef.set(task);
  }

  static Future<void> deleteTaskFromFireStore(Task task, String uId){
    return getTasksCollection(uId).doc(task.id).delete();
  }

  static CollectionReference<MyUser> getUsersCollection(){
    return FirebaseFirestore.instance.collection(MyUser.collectionName).
    withConverter<MyUser>(
        fromFirestore: ((snapshot, options) => MyUser.fromFireStore(snapshot.data())),
        toFirestore: (myUser , options) => myUser.toFireStore()
    );
  }

  static Future<void> addUserToFireStore(MyUser myUser){
    return getUsersCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFireStore(String uId) async{
    var querySnapshot = await getUsersCollection().doc(uId).get();
    return querySnapshot.data();
  }
}
// {} JSON object
// [] JSON array