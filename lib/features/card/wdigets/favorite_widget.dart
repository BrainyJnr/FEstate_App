import 'package:estateapp1/features/card/controller/favorite_controller.dart';
import 'package:estateapp1/features/model/all_model.dart';
import 'package:estateapp1/features/model/popular_model.dart';
import 'package:estateapp1/features/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../common/containers/appbar/fAppBar.dart';
import '../../../common/containers/frounded_container.dart';
import '../../../common/utilis/colors.dart';
import '../../../common/utilis/sizes.dart';
import '../../../common/widgets/loader/fAnimationLoaderWidget.dart';
import '../../../function/fcloud_helper_function.dart';
import '../../../function/fhelper_function.dart';
import '../../favorite_designs/favorite_design_screen.dart';
import 'festate_favorite_icon.dart';
import 'festate_houses.dart';
import 'festate_price.dart';
import 'festate_titletext.dart';
import 'ffavorite_listview_seperated.dart';
import '../../shimmers/fvertical_shimmer.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key,});



  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    final dark = fHelperFunctions.isDarkMode(context);

    return Scaffold(
        appBar: fAppBar(
          title: Text(
            "WishList",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .apply(color: fColors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 22, top: 12, right: 16),
          child: SingleChildScrollView(
            child: Obx(
                  () => FutureBuilder(
                  future: controller.favoriteProducts(),
                  builder: (context, snapshot) {
                    /// Nothing Found Widget
                    final emptyWidget = fAnimationLoaderWidget(
                      text: "Whoopes Wishlist is Empty...............",
                      image: "assets/loaders/Animation - 1717608048132.gif",
                      showAction: true,
                      actionText: "Let\'s add some",
                      onActionPressed: () => Get.offAll(() => BottomNavigation()),
                    );

                    const loader = fCategoryShimmer(

                    );
                    final widget = fCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: loader,
                        nothingFound: emptyWidget);
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return favorite_list_view_seperated(
                      itemCount: products.length,
                      itemBuilder: (_, index) => FavoriteDesignScreen(
                        all: products[index],
                      ),
                    );
                  }),
            ),
          ),
        ));
  }
}
