import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/utilis/colors.dart';


class fCartCountericon extends StatelessWidget {
  const fCartCountericon({
    super.key,
    this.iconColor, this.counterBgColor, this.counterTextColor,
  });

  final Color? iconColor,counterBgColor,counterTextColor;

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(CartController());
    return SingleChildScrollView(
      child: Stack(
        children: [
          IconButton(
              onPressed: () {},
              icon:  Icon(
                Iconsax.shopping_bag,
                color: iconColor,
              )),
          Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: fColors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(
                  Icons.check, // Add an icon or any widget here
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
