import 'package:cached_network_image/cached_network_image.dart';
import 'package:estateapp1/app.dart';
import 'package:estateapp1/common/containers/appbar/fAppBar.dart';
import 'package:estateapp1/common/containers/appbar/fHome_AppBar.dart';
import 'package:estateapp1/common/utilis/images.dart';
import 'package:estateapp1/data/device_utility.dart';
import 'package:estateapp1/features/card/controller/recent_controller.dart';
import 'package:estateapp1/features/card/wdigets/festae_location.dart';
import 'package:estateapp1/features/card/wdigets/festate_titletext.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../function/fhelper_function.dart';
import '../../image_controllers/recent_image_controller.dart';
import 'festate_price.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({super.key, required this.recent});

  final RecentModel recent;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controlles = RecentController.instance;
    final RecentImageController controller = Get.find();
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
                        final imageUrl = controller.selectedRecentEstate.value;
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
                      })
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
                      title: recent.title,
                      isLarge: true,
                    ),
                    estateprices(
                        price:  controlles.getRecentPrice(recent)
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
                          title: recent.location ?? "",
                        ),                        Row(
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
