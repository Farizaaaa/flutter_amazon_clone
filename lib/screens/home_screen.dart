import 'package:amazon_clone/widgets/banner_add_widget.dart';
import 'package:amazon_clone/widgets/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clone/widgets/products_showcase_list_view.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/simple_product_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> testChildren = [
    const SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
    const SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    const SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
    const SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(hasBackButton: false, isReadOnly: true),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CategoriesHorizonatlListviewBar(),
          BannerAddWidget(),
          ProductsShowcaseListView(
              title: "Upto 70% off", children: testChildren),
          ProductsShowcaseListView(
              title: "Upto 60% off", children: testChildren),
          ProductsShowcaseListView(
              title: "Upto 50% off", children: testChildren),
          ProductsShowcaseListView(title: "Explore", children: testChildren)
        ],
      )),
    );
  }
}
