import 'package:estateapp1/features/card/wdigets/festate_price.dart';
import 'package:estateapp1/features/card/wdigets/festate_titletext.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../common/containers/frounded_container.dart';
import '../../common/utilis/colors.dart';
import '../../common/utilis/sizes.dart';
import '../card/controller/all_controller.dart';
import '../card/wdigets/festae_location.dart';
import '../card/wdigets/festate_favorite_icon.dart';
import '../model/all_model.dart';

class FavoriteDesignScreen extends StatelessWidget {
  const FavoriteDesignScreen({super.key, required this.all});

  final AllModel all;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(All_Controller());

    return SizedBox(
      width: 320, // Make sure the parent widget has a defined width
      height: 110,
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(5),
          color: fColors.white,
        ),
        child: Row(
          children: [
            /// Thumbnail
            fRoundedContainer(
              height: 100,
              padding: const EdgeInsets.all(fSizes.sm),
              backgroundColor: fColors.white,
              child: Stack(
                children: [
                  fAllInCrunches(
                    width: 85,
                    fit: BoxFit.cover,
                    image: all.image,
                    isNetworkImage: true,
                  ),
                ],
              ),
            ),

            /// Wrap Column with Expanded to prevent overflow
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align left
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: fSizes.sm, left: fSizes.sm),
                    child: fEstateTitleText(title: all.title),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: fSizes.sm),
                    child: estateprices(price: controller.getAllPrice(all)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: fSizes.sm),
                    child: festatelocation(title: all.location ?? ""),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: fcircular_favorite_icon(estatesId: all.id),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class fAllInCrunches extends StatelessWidget {
  const fAllInCrunches({
    super.key,
    this.width,
    this.height,
    required this.image,
    this.applyImageRadius = false,
    this.border,
    this.backgroundColor = fColors.light,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.fit = BoxFit.contain,
    this.borderRadius = fSizes.md,
  });

  final double? width, height;
  final String image;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          color: backgroundColor,
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.circular(6),
            child: isNetworkImage
                ? Image.network(
              image,
              fit: fit,
              // errorBuilder: (context, error, stackTrace) {
              // return Center(
              // child: Icon(Icons.error, color: fColors.error),


            )
                : Image.asset(
              image,
              fit: fit,
              //  errorBuilder: (context, error, stackTrace) {
              // return Center(
              // child: Icon(Icons.error, color: fColors.error),
            )
        ),
      ),

    );
  }
}


