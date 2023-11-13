import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/screens/sell_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/accont_screen_app_bar.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/products_showcase_list_view.dart';
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
                    child: const Text("Sign in",
                        style: TextStyle(color: Colors.black)),
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: () {}),
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
                            builder: (context) => SellScreen(),
                          ));
                    }),
              ),
              ProductsShowcaseListView(
                  title: "Your Orders", children: testChildren),
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
                  child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text(
                      "Order: Black Show",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text("Address: Somwhere on earth"),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.check)),
                  );
                },
              ))
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
                  backgroundImage: NetworkImage(""),
                ),
              )
            ],
          )),
    );
  }
}
