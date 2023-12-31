//  import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
//  Size getScreenSize(BuildContext context){
// return MediaQueryData.fromView(View.of(context).size.;
//  }

//snackbar is a small portion coming on bottom of screen
  showSnackBar({required BuildContext context, required String content}) {
    //we use context coz we need know where the bottom of the page is
    //it can be calculated using context
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.grey,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          )),
    );
  }

  Future<Uint8List?> pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    return file!.readAsBytes();
  }

  String getUid() {
    return (100000 + Random().nextInt(10000)).toString();
  }
}
