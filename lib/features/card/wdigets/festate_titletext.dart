import 'package:flutter/material.dart';

import '../../../function/fhelper_function.dart';


class fEstateTitleText extends StatelessWidget {
  const fEstateTitleText({super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,  this.isLarge = false,

v
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  final bool isLarge;


  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Text(
      title,
      style: isLarge ?  Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.labelMedium!.apply(color: dark ? Colors.white : Colors.black ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}


class fPopularEstateTitleText extends StatelessWidget {
  const fPopularEstateTitleText({super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,  this.isLarge = false,


  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  final bool isLarge;


  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Text(
      title,
      style: isLarge ?  Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.labelMedium!.apply(color: dark ? Colors.white : Colors.black ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
