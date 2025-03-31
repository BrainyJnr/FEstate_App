import 'package:flutter/material.dart';

class festatelocation extends StatelessWidget {
  const festatelocation({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,  this.isLarge = false,  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          size: 8,
        ),
        SizedBox(width: 5),
        Text(
          title,
          style: Theme.of(context).textTheme.labelSmall!.apply(
              color: Colors.black.withOpacity(0.5)),
        ),
      ],
    );
  }
}

