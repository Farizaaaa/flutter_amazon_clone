import 'package:amazon_clone/models/review_model.dart';
import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RiviewDialog extends StatelessWidget {
  final String productUid;
  const RiviewDialog({super.key, required this.productUid});

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
      onSubmitted: (RatingDialogResponse res) async {
        CloudFirestoreClass().uploadReviewToDatabase(
            productUid: productUid,
            model: ReviewModel(
                senderName:
                    Provider.of<UserDetailsProvider>(context, listen: false)
                        .userDetails!
                        .name,
                description: res.comment,
                rating: res.rating.toInt()));

        print(res.comment);
        print(res.rating);
      },
    );
  }
}
