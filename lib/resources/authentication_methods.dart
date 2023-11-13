import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();

  Future<String> signUpUser(
      {required String name,
      required String address,
      required String email,
      required String password,
      required String cPassword}) async {
    //used to delete all white spaces coming in the textfield
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    cPassword.trim();
    String output = "Something went wrong!";
    if (name != "" &&
        address != "" &&
        email != "" &&
        password != "" &&
        cPassword != "") {
      //functions
      if (password == cPassword) {
        try {
          await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password);
              UserDetailsModel user = UserDetailsModel(name: name, address: address);
          await cloudFirestoreClass.uploadNameAndAddressToDatabase(
              user: user);

          output = "success";
        } on FirebaseAuthException catch (e) {
          output = e.message.toString();
        }
      } else {
        output = "passwords do not match";
      }
    } else {
      output = "Please fill up the fields";
    }
    return output;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    //used to delete all white spaces coming in the textfield

    email.trim();
    password.trim();
    String output = "Something went wrong!";
    if (email != "" && password != "") {
      //functions
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up the fields";
    }
    return output;
  }
}
