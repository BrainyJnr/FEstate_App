import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/icons/fcircular_icon.dart';

class fcircular_favorite_icon extends StatelessWidget {
  const fcircular_favorite_icon({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(FavoriteController());
    return fCircularIcon(
        icon: Icons.favorite_border,backgroundColor: Colors.white,
        color: Colors.white,size: 20,
        onPressed: () {},
    );
  }
}
