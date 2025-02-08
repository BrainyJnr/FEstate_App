import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/icon/favorite_icon.dart';
import '../../../features/shimmers/fshimmer_effect.dart';
import '../../authentication/controller/user_controller.dart';
import '../../utilis/colors.dart';
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
                    child: ClipOval(
                      // Makes the image circular
                      child: SizedBox(
                        width: 100, // Set your preferred size
                        height: 100,
                        child: Image.asset(
                          "assets/icon_profile/Profile_Logo.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
