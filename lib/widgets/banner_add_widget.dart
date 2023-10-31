import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class BannerAddWidget extends StatefulWidget {
  const BannerAddWidget({super.key});

  @override
  State<BannerAddWidget> createState() => _BannerAddWidgetState();
}

class _BannerAddWidgetState extends State<BannerAddWidget> {
  int currentAd = 0;

  @override
  Widget build(BuildContext context) {
    Size scrrenSize = MediaQuery.of(context).size;
    double smallHeight = scrrenSize.width / 5;

    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentAd == largeAds.length - 1) {
          currentAd = -1;
        }
        setState(() {
          currentAd++;
        });
      },
      child: Column(
        children: [
          //image with gradient
          Stack(
            children: [
              Image.network(
                largeAds[currentAd],
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: scrrenSize.width,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        backgroundColor,
                        backgroundColor.withOpacity(0)
                      ])),
                ),
              )
            ],
          ),
          Container(
            width: scrrenSize.width,
            height: smallHeight,
            decoration: BoxDecoration(
              border: Border.all(width: 0, color: backgroundColor),
              color: backgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSmallAdsFromIndex(0, smallHeight),
                getSmallAdsFromIndex(1, smallHeight),
                getSmallAdsFromIndex(2, smallHeight),
                getSmallAdsFromIndex(3, smallHeight),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getSmallAdsFromIndex(int index, double height) {
    return Container(
        height: height,
        width: height,
        decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 1)
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20))),
        child: Center(
            child: Column(
          children: [
            Image.network(smallAds[index]),
            const SizedBox(
              height: 5,
            ),
            Text(adItemNames[index])
          ],
        )));
  }
}
