import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/cart_item_widget.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: kAppBarHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection("cart")
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CustomMainButton(
                                  color: yellowColor,
                                  isLoading: true,
                                  onPressed: () {},
                                  child: const Text("Loading"));
                            } else {
                              return CustomMainButton(
                                  color: yellowColor,
                                  isLoading: false,
                                  onPressed: () async {
                                    await CloudFirestoreClass()
                                        .buyAllItemsInCart(
                                            userDetails: Provider.of<
                                                        UserDetailsProvider>(
                                                    context,
                                                    listen: false)
                                                .userDetails!);
                                    Utils().showSnackBar(
                                        context: context, content: "Done");
                                  },
                                  child: Text(
                                    "Proceed to buy (${snapshot.data!.docs.length}) items",
                                    style: const TextStyle(color: Colors.black),
                                  ));
                            }
                          })),
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection("cart")
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      } else {
                        return ListView.builder(
                            itemBuilder: (context, index) {
                              ProductModel model =
                                  ProductModel.getModelFromJson(
                                      json: snapshot.data!.docs[index].data());
                              return CartItemWidget(product: model);
                            },
                            itemCount: snapshot.data!.docs.length);
                      }
                    },
                  ),
                )
              ],
            ),
            const UserDetailsBar(
              offset: 0,
            ),
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
 * 
 * working of cart items from DB
 * =====================
 * -delete entire listview.builder
 * -add stremBuilder there
 * -make the proceed to buy n items showing button work
 * -wrap the button inside a stream builder and implement it there
 * 
 * delete button work
 * -make a function deleteProductFromCart in cloudfirestore
 * -use it in delete buttons onpressed on cartitemwidget
 * 
 * add button work
 * -crete on the onPreseed of that button
 * 
 * buy all items cart button functional by buying all
 * --------------
 * -create function buyAllItemsinCart in cloudfirestore
 * -
 */