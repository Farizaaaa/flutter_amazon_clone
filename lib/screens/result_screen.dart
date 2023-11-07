import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/widgets/results_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class ResulstScreen extends StatelessWidget {
  final String query;
  const ResulstScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(hasBackButton: false, isReadOnly: true),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Showing results for ",
                      style: TextStyle(fontSize: 17)),
                  TextSpan(
                      text: query,
                      style: const TextStyle(
                          fontSize: 17, fontStyle: FontStyle.italic))
                ]),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return ResultWidget(
                    product: ProductModel(
                        url:
                            "https://m.media-amazon.com/images/I/11M5KkkmavL._SS70_.png",
                        productName: "Fariza Latheef",
                        cost: 1000,
                        discount: 50,
                        uid: "asfhf",
                        sellerName: "jhcfbsdjkf",
                        sellerUid: "jfhnadjkf",
                        rating: 4,
                        noOfRating: 1));
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 2 / 3),
            ),
          )
        ],
      ),
    );
  }
}
/**
 * result_screen.dart
 * ==================
 * this screen the search result screen
 * create new widgets:category_widget.dart
 *                 -----------------------
 *              this widget is for specific category
 *              code the UI
 *                add a parameter query
 * -edit the main.dart
 * -inside
 * -else if (user.hasData) {
 * -comment =>return const ScreenLayout();
 * -add new return to ResultScreen
 * 
 * -create new widget:result_widget.dart
 *   --------------------------------- 
 *         this widget is for specific product
 *         add a parameter product as object of ProductModel 
 *         this is to add product details
 * -create new widget:rating_star_widget.dart
 *                       --------------------
 *                       this is to add a rating star below every products
 * 
 *             
 *          
 * 
 */