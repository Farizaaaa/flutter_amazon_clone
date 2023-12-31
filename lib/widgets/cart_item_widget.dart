import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:amazon_clone/screens/product_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_simple_round_button.dart';
import 'package:amazon_clone/widgets/custom_square_button.dart';
import 'package:amazon_clone/widgets/product_information_widget.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      height: screenSize.height / 1.5,
      width: screenSize.width,
      decoration: const BoxDecoration(
          color: backgroundColor,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(product: product),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width / 3,
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Center(
                            child: Image.network(product.url),
                          )),
                    ),
                    SizedBox(
                      width: screenSize.width / 15,
                    ),
                    ProductInformationWidget(
                        productName: product.productName,
                        cost: product.cost,
                        sellerName: product.sellerName)
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  CustomSquareButton(
                      onPressed: () {},
                      color: backgroundColor,
                      dimention: 40,
                      child: const Icon(Icons.remove)),
                  CustomSquareButton(
                      onPressed: () {},
                      color: Colors.white,
                      dimention: 40,
                      child: const Text(
                        "0",
                        style: TextStyle(color: activeCyanColor),
                      )),
                  CustomSquareButton(
                      child: const Icon(Icons.add),
                      onPressed: () async {
                        await CloudFirestoreClass().addProductToCart(
                            productModel: ProductModel(
                                url: product.url,
                                productName: product.productName,
                                cost: product.cost,
                                discount: product.discount,
                                uid: Utils().getUid(),
                                sellerName: product.sellerName,
                                sellerUid: product.sellerUid,
                                rating: product.rating,
                                noOfRating: product.noOfRating));
                      },
                      color: backgroundColor,
                      dimention: 40)
                ],
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CustomSimpleRoundButton(
                            onPressed: () async {
                              CloudFirestoreClass()
                                  .deleteProductFromCart(uid: product.uid);
                            },
                            text: "Delete"),
                        const SizedBox(
                          width: 7,
                        ),
                        CustomSimpleRoundButton(
                            onPressed: () {}, text: "Save for later"),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "See more like this",
                          style:
                              TextStyle(color: activeCyanColor, fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
