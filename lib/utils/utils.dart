//  import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          backgroundColor: Colors.orange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(content),
            ],
          )),
    );
  }
}
