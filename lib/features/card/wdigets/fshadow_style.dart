import 'package:estateapp1/common/utilis/colors.dart';
import 'package:flutter/material.dart';

class fShadowStyle {

 static final verticalProductShadow = BoxShadow(
   color: fColors.darkerGrey.withOpacity(0.1),
   blurRadius: 50,
   spreadRadius: 7,
   offset: const Offset(0, 2),
 );

 static final horizontalProductShadow = BoxShadow(
 color: fColors.darkerGrey.withOpacity(0.1),
 blurRadius: 50,
 spreadRadius: 7,
 offset: const Offset(0, 2),
 );
}