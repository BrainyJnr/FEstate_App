import 'package:estateapp1/common/utilis/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/icons/fcircular_icon.dart';
import '../controller/favorite_controller.dart';

class fcircular_favorite_icon extends StatelessWidget {
  const fcircular_favorite_icon({
    super.key, required this.estatesId,
  });

  final String estatesId;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(
      () => fCircularIcon(height: 100,width: 100,
          icon: controller.isFavourite(estatesId) ? Iconsax.heart5 : Iconsax.heart,size: 20,
          //backgroundColor: Colors.white,
        backgroundColor: Colors.white,
          color: controller.isFavourite(estatesId) ? Colors.white : null,
          onPressed: () => controller.toggleFavoriteProduct(estatesId),
      ),
    );
  }
}
