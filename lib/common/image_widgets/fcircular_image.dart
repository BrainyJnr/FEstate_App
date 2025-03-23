import 'package:cached_network_image/cached_network_image.dart';
import 'package:estateapp1/features/shimmers/fshimmer_effect.dart';
import 'package:flutter/material.dart';

import '../utilis/sizes.dart';

class fCircular_Images extends StatelessWidget {
  const fCircular_Images(
      {super.key,
      this.fit = BoxFit.cover,
      required this.image,
      this.isNetworkImage = true,
      this.overlayColor,
      this.backgroundColor,
      this.width = 100,
      AssetImage = false,
      this.height = 1000,
      this.padding = fSizes.sm});

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
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          //color: backgroundColor ?? (fHelperFunctions.isDarkMode(context) ? fColors.black : fColors.white),
          borderRadius: BorderRadius.circular(1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: image,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        const fShimmerEffect(
                          width: 55,
                          height: 55,
                          radius: 55,
                        ),
                    errorWidget: (context, url, error) => const Icon(Icons.error))
                : Image(
                    image: AssetImage(image),
                    fit: fit,
                    color: overlayColor,
                  )),
      ),
    );
  }
}
