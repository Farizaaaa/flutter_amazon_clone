import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final ProductModel product;
  const ResultWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: screenSize.width / 3, child: Image.network(product.url)),
            Padding(
              padding: const EdgeInsets.only(bottom:5.0),
              child: Text(product.productName,maxLines: 3,overflow: TextOverflow.ellipsis,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:5.0),
              child: Row(
                children: [
                  SizedBox(
                      width: screenSize.width / 5,
                      child: FittedBox(child: RatingStar(rating: product.rating))),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      product.noOfRating.toString(),
                      style: const TextStyle(color: activeCyanColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20, child: FittedBox(child: CostWidget(color: Color.fromARGB(255, 92, 9, 3), cost: product.cost)))
          ],
        ),
      ),
    );
  }
}
