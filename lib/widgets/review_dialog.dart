import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RiviewDialog extends StatelessWidget {
  const RiviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      initialRating: 0.0,
      // your app's name?
      title: const Text(
        'Type a review for this product',
        textAlign: TextAlign.center,
        style: TextStyle(
          //color: Colors.grey,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),

      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(color: Colors.orange),
      commentHint: 'Type here',
      onCancelled: () => print('cancelled'),
      onSubmitted: (RatingDialogResponse res) {
        print(res.comment);
        print(res.rating);
      },
    );
  }
}
