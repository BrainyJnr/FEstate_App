import 'package:flutter/material.dart';

import '../utilis/sizes.dart';

class fCircular_Images extends StatelessWidget {
  const fCircular_Images({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = true,
    this.overlayColor,
    this.backgroundColor,
    this.width = 66,
    AssetImage = false,
    this.height = 1000,
    this.padding = fSizes.sm


  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding:  EdgeInsets.all(padding),
        decoration: BoxDecoration(
          //color: backgroundColor ?? (fHelperFunctions.isDarkMode(context) ? fColors.black : fColors.white),
            borderRadius: BorderRadius.circular(1)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          //  child: Center(
          child: Image(   fit: fit,
            image:  AssetImage(image),
            color: overlayColor,

          ),)
    );
  }
}
