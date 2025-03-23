import 'package:cached_network_image/cached_network_image.dart';
import 'package:estateapp1/app.dart';
import 'package:estateapp1/common/containers/appbar/fAppBar.dart';
import 'package:estateapp1/common/containers/appbar/fHome_AppBar.dart';
import 'package:estateapp1/common/utilis/images.dart';
import 'package:estateapp1/data/device_utility.dart';
import 'package:estateapp1/features/card/wdigets/festae_location.dart';
import 'package:estateapp1/features/card/wdigets/festate_titletext.dart';
import 'package:estateapp1/features/model/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../function/fhelper_function.dart';
import '../../image_controllers/popular_image_controller.dart';
import '../controller/popular_controller.dart';
import 'festate_price.dart';

class PopularDetailImage extends StatelessWidget {
  const PopularDetailImage({super.key, required this.popular});

  final PopularModel popular;

  @override
  Widget build(BuildContext context) {
    final controlles = PopularController.instance;
    final dark = fHelperFunctions.isDarkMode(context);
    final PopularImageController controller = Get.find();
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
                      child: Obx(() {
                        final imageUrl = controller.selectedPopularEstate.value;
                        return CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          height: 340,
                          width: fDeviceUtilis.getScreenWidth(context),
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: Colors.white,
                          ),
                        );
                      }))
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
                      title: popular.title,
                      isLarge: true,
                    ),
                    Popularestateprices(
                        price:  controlles.getPopularPrice(popular)
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
                        festatelocation(
                          dark: dark,
                          isLarge: true,
                          title: popular.description,
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
