import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/utilis/colors.dart';
import '../../function/fhelper_function.dart';

class fShimmerEffect extends StatelessWidget {
  const fShimmerEffect({
    Key ? key,
    required this.width,
    required this.height,
    this.radius = 25,
    this.color,


  }) : super(key: key);

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor : dark ? Colors.grey[850]! :Colors.grey[300]!,
        highlightColor:  dark ? Colors.grey[700]! : Colors.grey[100]!,
        child : Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? (dark ? fColors.darkGrey : fColors.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        )
    );
  }
}
