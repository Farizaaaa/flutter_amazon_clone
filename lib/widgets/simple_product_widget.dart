import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/screens/product_screen.dart';
import 'package:flutter/material.dart';

class SimpleProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const SimpleProductWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(product: productModel)));
      },
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          //height: 20,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(productModel.url),
          ),
        ),
      ),
    );
  }
}
