import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsBar extends StatelessWidget {
  final double offset;

  const UserDetailsBar({
    super.key,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    UserDetailsModel? userDetailss = Provider.of<UserDetailsProvider>(
      context,
      listen: true,
    ).userDetails!;
    //print(userDetailss.name);
    return Positioned(
      top: -offset / 3,
      child: Container(
        height: kAppBarHeight / 2,
        width: screenSize.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: lightBackgroundaGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[900],
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.7,
                child: Text(
                  "Deliver to ${userDetailss.name} - ${userDetailss.address}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[900]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
