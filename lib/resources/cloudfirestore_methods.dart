import 'dart:typed_data';

import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future uploadNameAndAddressToDatabase(
      {required UserDetailsModel user}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.getJson());
  }

  Future getnameAndAddress() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    //print(snap.data());

    UserDetailsModel userModel = UserDetailsModel.getModelFromJson(
      (snap.data() as dynamic),
    );
    //print(userModel.getJson()); //same as print(snap);
    return userModel;
  }

  Future<String> uploadProductToDatabase({
    required Uint8List? image,
    required String productName,
    required String rawCost,
    required int discount,
    required String sellerName,
    required String sellerUid,
  }) async {
    productName.trim();
    rawCost.trim();
    String output = "success";
    if (image != null && productName != "" && rawCost != "") {
      try {
        //do more
        String uid = Utils().getUid();
        String url = await uploadImageToDatabase(image: image, uid: uid);
        print(url);
        double cost = double.parse(rawCost);
        cost = cost * (discount / 100);
        ProductModel product = ProductModel(
            url: url,
            productName: productName,
            cost: cost,
            discount: discount,
            uid: uid,
            sellerName: sellerName,
            sellerUid: sellerUid,
            rating: 5,
            noOfRating: 0);
            firebaseFirestore.collection("products").doc(uid).set(product.)
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please make sure all the fields are not empty";
    }
    return output;
  }

  Future<String> uploadImageToDatabase(
      {required Uint8List image, required String uid}) async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child("products").child(uid);
    UploadTask uploadTask = storageRef.putData(image);
    TaskSnapshot task = await uploadTask;
    return task.ref.getDownloadURL();
  }
}
