import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/banner_add_widget.dart';
import 'package:amazon_clone/widgets/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clone/widgets/products_showcase_list_view.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    //if anything changes in the screen we want to deetct it by the controller to controll the scrolling
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
      print(controller.position.pixels);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(hasBackButton: false, isReadOnly: true),
      body: Stack(children: [
        SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                SizedBox(
                  height: kAppBarHeight / 2,
                ),
                const CategoriesHorizonatlListviewBar(),
                const BannerAddWidget(),
                ProductsShowcaseListView(
                    title: "Upto 70% off", children: testChildren),
                ProductsShowcaseListView(
                    title: "Upto 60% off", children: testChildren),
                ProductsShowcaseListView(
                    title: "Upto 50% off", children: testChildren),
                ProductsShowcaseListView(
                    title: "Explore", children: testChildren)
              ],
            )),
        UserDetailsBar(
          offset: offset,
        )
      ]),
    );
  }
}
