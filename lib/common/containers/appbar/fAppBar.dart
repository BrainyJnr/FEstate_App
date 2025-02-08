import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/device_utility.dart';
import '../../../function/fhelper_function.dart';
import '../../utilis/colors.dart';
import '../../utilis/sizes.dart';

class fAppBar extends StatelessWidget implements PreferredSizeWidget {
  const fAppBar({
    super.key,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.title,
    this.leadingOnpressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnpressed;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return  AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
            onPressed: () => Get.back(),
            icon:  Icon(Iconsax.arrow_left,color: dark ? fColors.white : fColors.dark,))
            : leadingIcon != null
            ? IconButton(
            onPressed: leadingOnpressed, icon: Icon(leadingIcon))
            : null,
        title: title,
        actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(fDeviceUtilis.getAppBarHeight());
}
