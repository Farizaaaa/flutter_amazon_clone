import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/category_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBarWidget(hasBackButton: true, isReadOnly: false),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                childAspectRatio: 2.2 / 3.5,
                mainAxisSpacing: 15),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) => CategoryWidget(index: index),
          ),
        ));
  }
}


/**
 * more_screen.dart
 * ==============
 * stateless
 * only stateless screen
 * change constants
 * on category screen
 * --------------
 * -on ontap pass the call to result screen
 * 
 */