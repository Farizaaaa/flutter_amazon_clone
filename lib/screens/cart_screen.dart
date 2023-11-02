import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/widgets/cart_item_widget.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(hasBackButton: false, isReadOnly: true),
      body: Center(
        child: Column(
          children: [
            UserDetailsBar(
              offset: 0,
              userDetails:
                  UserDetailsModel(name: "Aadhi", address: "Somewhere"),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: CustomMainButton(
                    child: Text(
                      "Proceed to by (n) items",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: yellowColor,
                    isLoading: false,
                    onPressed: () {}),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => CartItemWidget(
                    product: ProductModel(
                        url:
                            "https://m.media-amazon.com/images/I/11M5KkkmavL._SS70_.png",
                        productName: "Fariza Latheef",
                        cost: 1000,
                        discount: 50,
                        uid: "asfhf",
                        sellerName: "jhcfbsdjkf",
                        sellerUid: "jfhnadjkf",
                        rating: 3,
                        noOfRating: 1)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/**
 * cart_screen.dart
 * ==============
 * -edit constants
 * -state full widget
 * -add
 * -SearchBarWidget
 * -UserDetailsBar
 * -CustomMainButton
 * -make
 *  Widgets:cart_item_widget.dart
 *  ----------------
 *   -create its UI
 *   -we wanted the cart item horizontally divided by three rows in 5:1:1 ratio
 *   -we acquire it through 3Expanded widgets with flex 5:1:1
 *   - to add info of product create a new wIDGET:product_information_widget.dart
 *                          -create three parameters name,cost,sellername
 *   -insert ProductInformationWidget to the item  page
 *   - to add info of product codt craete Widgets:cost_widget.dart
 *                           -crteate two parameters color,cost
 *   -create new widget:custom_square_buton.dart
 *   --------------------
 *   -stateless
 *   -tehse are to apply add,delete operations of cart item
 *   -passs parameters child,color,onPressesd,dimention
 *    -add it in cart_item_widget
 *   -crete new custom_simple_rounded_button.dart
 *   -------------
 *   -pass two parameters onpressed,text
 *
 * -connect it with cartscreeen
 * -give a ListView builder and give CartItemWidget()
 * -creating values of product info in cart_item widget
 * -changing value static to dynamic
 * -it will take a lot of time
 * -so we start a collection for it in the database
 *     -create models:product_model.dart
 *     -pass off fields of DB table
 *     final String url;
  final String productName;
  final double cost;
  final int discount;
  final String uid;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int noOfRating;
 *-fix tis at top of cart_item as a parameter
 -change all values inside the cart_item page to parameter.value
 * 
 */