import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:flutter/material.dart';

class UserDetailsProvider with ChangeNotifier {
//we aare initializing all values first to null
//to prevent null errors
  UserDetailsModel? userDetails;
//  UserDetailsProvider()
//       : userDetails = UserDetailsModel(name: "Loading", address: "Loading");
  Future getData() async {
    userDetails = await CloudFirestoreClass().getnameAndAddress();
    //print(userDetails!.address);
    notifyListeners();
  }
}

/**
 * create class UDP
 * inherit it from CNP
 * -create an object of UDM
 * -initilise it to null by ?
 * create constructor of UDP and initialize object of UDM in it
 * 
 * -inside the resourses:cloudfirestore_resourses
 * -create a future function to return the instance got from DB to PRovider
 * -in the form of UDM
 * 
 * -in the  user_details_model create a new function to return the data in our required preference
 * -in the form of factory
 * 
 * 
 -finally call the function in the UDP
 * -add notifylistener inside the function
 * 
 * activate this provider in the main
 * 
 * -use provider in the user_detail_bar
 * -by deleting its parameters and accessing the value from provider
 * 
 * -in the screen layout craete an instance of this provider to 
 * -make the user authenticated
 * 
 * 
 * 
 * 
 * 
 * 
 */
