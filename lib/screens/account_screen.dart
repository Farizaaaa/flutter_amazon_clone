import 'package:amazon_clone/models/order_requests_model.dart';
import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/screens/sell_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/accont_screen_app_bar.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/products_showcase_list_view.dart';
import 'package:amazon_clone/widgets/simple_product_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AccountScreenAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height - (kAppBarHeight / 2),
          width: screenSize.width,
          child: Column(
            children: [
              const IntroductionWidgetAccountScreen(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                    child: const Text("Sign Out",
                        style: TextStyle(color: Colors.black)),
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                    child: const Text("Sell",
                        style: TextStyle(color: Colors.black)),
                    color: yellowColor,
                    isLoading: false,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SellScreen(),
                          ));
                    }),
              ),
              //future Builder is just like the stream builder
              //dosnt constantly  listen for the changes it wait for a
              //future function or async or await to complete and rebuild the builder
              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("orders")
                      .get(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else {
                      List<Widget> children = [];
                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        ProductModel model = ProductModel.getModelFromJson(
                            json: snapshot.data!.docs[i].data());
                        children.add(SimpleProductWidget(productModel: model));
                      }
                      return ProductsShowcaseListView(
                          title: "Your Orders", children: children);
                    }
                  }),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Order Requests",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                    )),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("orderRequests")
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            OrderRequestModel model =
                                OrderRequestModel.getModelFromJson(
                                    json: snapshot.data!.docs[index].data());
                            return ListTile(
                              title: Text(
                                "Order: ${model.orderName}",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text("Address: ${model.buyersAddress}"),
                              trailing: IconButton(
                                  onPressed: () async {
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .collection("orderRequests")
                                        .doc(snapshot.data!.docs[index].id)
                                        .delete();
                                  },
                                  icon: Icon(Icons.check)),
                            );
                            ;
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetails = Provider.of<UserDetailsProvider>(
      context,
      listen: true,
    ).userDetails!;
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Container(
          height: kAppBarHeight / 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.00000000001)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Hello, ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                      )),
                  TextSpan(
                      text: "${userDetails.name}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold))
                ])),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i0.wp.com/www.tech-sisters.com/wp-content/uploads/2020/02/muslim-women-in-tech-amina-aweis-profile-picture.jpg?resize=400%2C400"),
                ),
              )
            ],
          )),
    );
  }
}
