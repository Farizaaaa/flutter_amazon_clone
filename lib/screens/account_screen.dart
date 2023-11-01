import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/accont_screen_app_bar.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/products_showcase_list_view.dart';
import 'package:flutter/material.dart';

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
                    child:
                        const Text("Sign in", style: TextStyle(color: Colors.black)),
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                    child: const Text("Sell", style: TextStyle(color: Colors.black)),
                    color: yellowColor,
                    isLoading: false,
                    onPressed: () {}),
              ),
              ProductsShowcaseListView(
                  title: "Your Orders", children: testChildren),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Align(alignment: Alignment.centerLeft, child: Text("Order Requests",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900),)),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text("Order: Black Show",style: TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: const Text("Address: Somwhere on earth"),
                    trailing:
                        IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
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
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "Hello,",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                      )),
                  TextSpan(
                      text: " Aadhi",
                      style: TextStyle(
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


/**
 * 1.AccountScreen.dart
 * =================
 * -create statefull widget
 * -change constants page screens list
 * -atttach AppBar
 * -code UI
 * -Extract IntroductionWidgetAccountScreen
 * -add buttons CustommAINbUTTON
 * 
 * 2.Widgets:Account_screen_app _bar.dart
 * ---------------------
 * -create a stateless widget
 * -inherit it from PrefferedSizedWidget
 * -give a parameter
 * -give override
 * @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  -give appbar in AccountScreen
  -code UI of App BAr

 * 
 * 
 */