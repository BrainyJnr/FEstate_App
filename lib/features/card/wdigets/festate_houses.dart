import 'package:flutter/material.dart';

import '../../../common/utilis/colors.dart';
import '../../../common/utilis/sizes.dart';

class festates extends StatelessWidget {
  const festates({
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
