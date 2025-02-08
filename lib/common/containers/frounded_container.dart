import 'package:flutter/material.dart';

import '../utilis/colors.dart';

class fRoundedContainer extends StatelessWidget {
  const fRoundedContainer({super.key,
    this.width,
    this.height,
    this.radius = 12,
    //fSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = fColors.borderPrimary,
    this.backgroundColor = fColors.white,
    this.padding,
    this.margin, this.onpressed,

  });

  final double? width;
  final double? height;
  final VoidCallback? onpressed;
  final double radius;
  final Widget? child;
  final bool showBorder;
  //final Color redContainer;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;




  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null
      ),
      child: child,


    );
  }
}
