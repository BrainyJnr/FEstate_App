import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../function/fhelper_function.dart';

class estateprices extends StatelessWidget {
  const estateprices({
    super.key,

    this.currencySign = "",
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,

  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Text(
        currencySign + price,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? Theme.of(context).textTheme.labelMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.labelLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null,)
    );
  }
}


class Popularestateprices extends StatelessWidget {
  const Popularestateprices({
    super.key,

    this.currencySign = "",
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,

  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Text(
        currencySign + price,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? Theme.of(context).textTheme.labelMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.labelLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null,)
    );
  }
}
