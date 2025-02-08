import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utilis/colors.dart';
import '../../utilis/images.dart';
import '../../utilis/sizes.dart';
import '../controller/login_controller.dart';

class fSocialButtons extends StatelessWidget {
  const fSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: fColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
                width: fSizes.iconMd,
                height: fSizes.iconMd,
                image: NetworkImage(fImages.google)),
          ),
        ),
        const SizedBox(
          width: fSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: fColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: fSizes.iconMd,
                height: fSizes.iconMd,
                image: NetworkImage(fImages.facebook)),
          ),
        ),
      ],
    );
  }
}
