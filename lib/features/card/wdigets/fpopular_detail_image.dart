import 'package:estateapp1/app.dart';
import 'package:estateapp1/common/containers/appbar/fAppBar.dart';
import 'package:estateapp1/common/containers/appbar/fHome_AppBar.dart';
import 'package:estateapp1/common/utilis/images.dart';
import 'package:estateapp1/data/device_utility.dart';
import 'package:estateapp1/features/card/wdigets/festae_location.dart';
import 'package:estateapp1/features/card/wdigets/festate_titletext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../function/fhelper_function.dart';
import 'festate_price.dart';

class PopularDetailImage extends StatelessWidget {
  const PopularDetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Stack(children: [
      Column(
        children: [
          /// Main Large Image
          Container(
            height: 400, // Increased height
            width: fDeviceUtilis.getScreenWidth(context),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),

            child: Column(children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    child: Image.asset(
                      fImages.Estate5,
                      fit: BoxFit.cover,
                      height: 320,
                      width: fDeviceUtilis.getScreenWidth(context),
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    fEstateTitleText(
                      title: "Gardentop apartment",
                      isLarge: true,
                    ),
                    Popularestateprices(
                      price: "3000",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        festatelocation(dark: dark,
                          isLarge: true,
                          title: "London mongopak",
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 10,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "4.6",
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        )
                      ]))
            ]),
          ),
        ],
      ),
      fHomeAppBar(
        home: '',
        onTap: () async {
          Navigator.pop(context); // Use async to match Future<void> return type
        },
      )
    ]);
  }
}