import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/custom_simple_round_button.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
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
                                            fontSize: 16),
                                      ),
                                    ),
                                    Text(widget.product.productName)
                                  ],
                                ),
                                RatingStar(rating: widget.product.rating)
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
                              onPressed: () {},
                              text: "Add a review for this product"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height,
                    )
                  ]),
                ),
              ),
              UserDetailsBar(
                  offset: 0,
                  userDetails: UserDetailsModel(
                      name: "Fariza", address: "Somwhere on Earth"))
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
 * 
 */