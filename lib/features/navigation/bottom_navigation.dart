import 'package:estateapp1/features/card/wdigets/favorite_widget.dart';
import 'package:estateapp1/features/favorite_designs/favorite_design_screen.dart';
import 'package:estateapp1/features/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/utilis/colors.dart';
import '../../function/fhelper_function.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = fHelperFunctions.isDarkMode(context);

    return Scaffold(
        bottomNavigationBar: Obx(
              () => NavigationBar(
                indicatorShape: Border.all(color: Colors.blue),
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            backgroundColor: darkMode ? fColors.white : Colors.black,
            indicatorColor: darkMode ? Colors.transparent : Colors.transparent,

            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: ""),
              NavigationDestination(icon: Icon(Iconsax.heart), label: ""),
              NavigationDestination(icon: Icon(Icons.search_rounded), label: ""),
             // NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
             // NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
              NavigationDestination(icon: Icon(Iconsax.user), label: ""),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value])
    );
  }
}

class NavigationController extends GetxController {

  final Rx<int> selectedIndex = 0.obs;


  final screens = [const HomeScreen(), const FavoriteWidget(), const SearchScreen(), const ProfileScreen(),];
}