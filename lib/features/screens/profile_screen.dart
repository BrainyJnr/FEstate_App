import 'package:estateapp1/common/widgets/headings_MenuTiles/fsections_menutile.dart';
import 'package:estateapp1/features/widgets/edit_profile_screen.dart';
import 'package:estateapp1/features/widgets/edit_profile_tile.dart';
import 'package:estateapp1/features/widgets/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/authentication/controller/user_controller.dart';
import '../../common/authentication/repostries/auth_repository.dart';
import '../../common/utilis/sizes.dart';
import '../../common/widgets/headings_MenuTiles/fsection_heading.dart';
import '../../dummy/repository/dummy_repository.dart';
import '../../dummy/screen/dummy_data._screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerUpload = Get.put(DummyRepository());
    final controller = Get.put(AuthenticationRepository());
    final controllers = UserController.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile"),
      ),
      body: Column(
          children: [
        UserProfile(),
        const Padding(padding: EdgeInsets.only(left: 12)),
        const SizedBox(
          height: 7,
          width: 10,
        ),
        fSectionHeading(
          title: "My Account",
          showActionButton: false,
        ),
        const SizedBox(
          height: fSizes.spaceBtwItems,
        ),
        fSettingsMenuTile(
          title: "My Profile",
          icon: Iconsax.user,
          onTap: () => Get.to(ChangeName()),
          trailing: const Icon(
            Iconsax.arrow_right_34,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        fSectionHeading(
          title: "More",
          showActionButton: false,
        ),
        fSettingsMenuTile(
          title: "Support",
          icon: Iconsax.call,
          onTap: () {
            // controllerUpload.uploadDummydata(fDummyData.RecentEstates);
          },
          trailing: const Icon(
            Iconsax.arrow_right_34,
          ),
        ),
        InkWell(
            child: fSettingsMenuTile(
          icon: Iconsax.logout,
          onTap: () {
            controller.logout();
          },
          title: "Log out",
          trailing: const Icon(Iconsax.arrow_right_34),
        ))
      ]),
    );
  }
}
