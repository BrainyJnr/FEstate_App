import 'package:estateapp1/common/containers/frounded_container.dart';
import 'package:estateapp1/common/utilis/colors.dart';
import 'package:estateapp1/common/utilis/sizes.dart';
import 'package:estateapp1/features/card/controller/recent_controller.dart';
import 'package:estateapp1/features/card/wdigets/festae_location.dart';
import 'package:estateapp1/features/card/wdigets/festate_favorite_icon.dart';
import 'package:estateapp1/features/card/wdigets/festate_price.dart';
import 'package:estateapp1/features/card/wdigets/festate_titletext.dart';
import 'package:estateapp1/features/card/wdigets/fshadow_style.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:estateapp1/function/fhelper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/image_widgets/frounded_image.dart';
import '../../../common/utilis/images.dart';
import '../../screens/frecent_posted_detailscreen.dart';

class fRecentPosted extends StatelessWidget {
  const fRecentPosted({super.key, required this.recent});

  final RecentModel recent;

  @override
  Widget build(BuildContext context) {
    final controller = RecentController.instance;
    final dark = fHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () =>  Get.to(frecentPostedDetailscreen(recent: recent)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 5,right: 5),
          child: Container(
            width: 148,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              boxShadow: [fShadowStyle.verticalProductShadow],
              borderRadius: BorderRadius.circular(fSizes.productImageRadius),
              color: dark ? fColors.darkerGrey : fColors.white,
            ),
            child: Column(
              children: [
                /// Thumbnail, Wishlist Button, Discount Tag
                fRoundedContainer(
                  height: 100,
                  padding: const EdgeInsets.all(fSizes.sm),
                  backgroundColor: dark ? fColors.dark : fColors.light,
                  child: Stack(
                    children: [
                      /// -- Thumbnail Image
                       fRoundedImage(fit: BoxFit.cover,
                        imageUrl: recent.image,
                        applyImageRadius: true,isNetworkImage: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: fSizes.spaceBtwItems / 2,),

                /// -- Details
                Padding(padding: EdgeInsets.only(left: fSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fEstateTitleText(title: recent.title,smallSize: true,),
                    festatelocation(dark: dark,
                      isLarge: true,
                      title: recent.location,
                    ),                    Row(
                      children: [
                          estateprices(
                         price:  controller.getRecentPrice(recent)
                                               ),
                       SizedBox(width: 65),
                  fcircular_favorite_icon(), // Your favorite icon widget

                  ],
                ),]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

