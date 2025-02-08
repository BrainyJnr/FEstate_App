import 'package:flutter/material.dart';

import '../utilis/colors.dart';

class fPrimaryHeaderContainer extends StatelessWidget {
  const fPrimaryHeaderContainer({
    super.key, required this.child,
  });
  final Widget child;


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: [
           Container(
            decoration: BoxDecoration(
                color: fColors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            height: 260,
            width: 400,
            padding: const EdgeInsets.all(0),
          ),child,
       ] ),);
  }
}
