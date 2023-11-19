import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/models/review_model.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/custom_simple_round_button.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:amazon_clone/widgets/review_dialog.dart';
import 'package:amazon_clone/widgets/review_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThing = Expanded(child: Container());
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: SearchBarWidget(hasBackButton: true, isReadOnly: true),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(children: [
                    SizedBox(
                      height: screenSize.height -
                          (kAppBarHeight + (kAppBarHeight / 2)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kAppBarHeight / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        widget.product.sellerName,
                                        style: const TextStyle(
                                            color: activeCyanColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Text(
                                      widget.product.productName,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                RatingStar(
                                  rating: widget.product.rating,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              height: screenSize.height / 3,
                              constraints: BoxConstraints(
                                  maxHeight: screenSize.height / 3),
                              child: Image.network(widget.product.url),
                            ),
                          ),
                          spaceThing,
                          CostWidget(
                              color: Colors.black, cost: widget.product.cost),
                          spaceThing,
                          CustomMainButton(
                              color: Colors.orange,
                              isLoading: false,
                              onPressed: () {},
                              child: const Text("Buy Now",
                                  style: TextStyle(color: Colors.black))),
                          spaceThing,
                          CustomMainButton(
                              color: yellowColor,
                              isLoading: false,
                              onPressed: () {},
                              child: const Text("Add to Cart",
                                  style: TextStyle(color: Colors.black))),
                          spaceThing,
                          CustomSimpleRoundButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => RiviewDialog(
                                        productUid: widget.product.uid));
                              },
                              text: "Add a review for this product"),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: screenSize.height / 2,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("products")
                                .doc(widget.product.uid)
                                .collection("reviews")
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<
                                        QuerySnapshot<Map<String, dynamic>>>
                                    snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container();
                              } else {
                                return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      ReviewModel model =
                                          ReviewModel.getModelFromJson(
                                              json: snapshot.data!.docs[index]
                                                  .data());
                                      return ReviewWidget(review: model);
                                    });
                              }
                            })),
                    SizedBox(
                      height: screenSize.height,
                    )
                  ]),
                ),
              ),
              const UserDetailsBar(
                offset: 0,
              )
            ],
          )),
    );
  }
}


/**
 * create product_screen.dart
 * add parameter ProductModel clss object
 * add 
 * rating_star widget and user_details_model
 * add 
 * Custom Main Button 2
 * add CustomSimpleButton
 * -create a model class named review_model 
 *   -this is for creating the riview button work in DB
 *    -create new widget:review_widget.dart
 *                  --------------------------
 *                  add parameter reviewModel
 * -connect it on the product screen as listview.builder
 * to make this page appear after clicking product pic
 * ----------------------
 * -in the simple_product_widget
 * -add new parameter of product model
 * -give gesture detector nad in ontap
 * -give navigator .push to productscreen
 * 
 * chnage the teschildren list in constants:which shows the products from the database
 * -inside it addd Simple_product_widget with required parameters
 * 
 * -create new file widgets:review_dialod.dart
 * ------------------------------------------
 * this is to add the dialog box coming after clicking on the addreviewforthisproduct button
 *! -for this we have to use a package called rating_dialog
 * add it in the pubspec.yaml file
 * -for this copy the example of rating dialog from pub.dev
 * andd update the code in it
 * 
 * 
 * - call the reviewdialog widget in the product screen inside the CustomSimpleWidgetButton
 * -using showDialog ()
 * 
 * review collection
 * ==================
 * -take the child listview of SizedBox
 * - and put it inside a StreamBuilder
 * -the StreamBuilder will constantly listen to changes that happening in the collection section of productcollection
 * -when we add a review in the dialog box it will appear quickly below the review section
 * -there will be a collection of review inside every product 
 * -thus each product will have a folder named review 
 * -thus we want changes to this reviews collection and add those items to a listview inside a stream builder
 * -AsyncSnapshot? checkout
 * -create a class inside reviewModel getModelFromJson
 * -create a future function uploadReviewtodatabase in the cloudfirestore 
 * -using this we can upload review to db
 * -create a getJson function inside the ReviewModel to use inside it
 * -inside the reviewDialod widget add one more parameter called productUid
 *       -create a function inside onSubmitted to submit data into cloudFirestore 
 *       -in the onsubmitted section
 * inside productscreen at Customsimpleroundedbutton add parameter to review dialog
 * 
 */