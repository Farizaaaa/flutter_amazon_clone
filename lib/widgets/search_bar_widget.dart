import 'package:amazon_clone/screens/result_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/search_screen.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;

  SearchBarWidget(
      {super.key,
      prefferedSize,
      required this.hasBackButton,
      required this.isReadOnly});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//final Size prefferedSize=;

  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: Colors.grey, width: 1));
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: kAppBarHeight,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        hasBackButton
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))
            : Container(),
        SizedBox(
          width: screenSize.width * 0.7,
          height: 45,
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 5))
            ]),
            child: TextField(
              onSubmitted: (String query) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResulstScreen(query: query)));
              },
              readOnly: isReadOnly,
              onTap: () {
                if (isReadOnly) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                }
              },
              decoration: InputDecoration(
                hintText: "Search for something in amazon",
                fillColor: Colors.white,
                filled: true,
                border: border,
                focusedBorder: border,
              ),
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.mic_none_outlined))
      ]),
    );
  }
}
