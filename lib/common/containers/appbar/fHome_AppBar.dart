import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/icon/favorite_icon.dart';
import '../../../features/shimmers/fshimmer_effect.dart';
import '../../authentication/controller/user_controller.dart';
import '../../image_widgets/fcircular_image.dart';
import '../../utilis/colors.dart';
import '../../utilis/images.dart';
import '../../utilis/texts.dart';
import 'fAppBar.dart';

class fHomeAppBar extends StatelessWidget {
  const fHomeAppBar({
    super.key, required this.home, required this.onTap,
  });

  final String home;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return fAppBar(
      title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Container(
                    child: Container(
                      child: Padding(
                          padding: EdgeInsets.only(left: 7),
                          child: IconButton(
                              onPressed: onTap,
                             icon: Icon(Icons.arrow_back_ios))),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),

                Text(
                  home,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: fColors.grey),
                ),
                Container(
                  child: Container(
                  child:   Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : fImages.PopularEstates8;
                      return controller.imageUploading.value
                          ? const fShimmerEffect(width: 80, height: 80, radius: 80)
                          : fCircular_Images(
                          fit: BoxFit.cover,backgroundColor: Colors.brown,
                          image: image, width: 60,height: 55, isNetworkImage: networkImage.isNotEmpty);
                    }),
                  ),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),

                //onPressed: () {  },)
              ],
            ),
          ]),
    );
  }
}
