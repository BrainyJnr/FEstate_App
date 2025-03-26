import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estateapp1/app.dart';
import 'package:estateapp1/common/containers/appbar/fHome_AppBar.dart';
import 'package:estateapp1/common/containers/fSearch_container.dart';
import 'package:estateapp1/common/utilis/sizes.dart';
import 'package:estateapp1/common/widgets/headings_MenuTiles/fsection_heading.dart';
import 'package:estateapp1/features/card/controller/popular_controller.dart';
import 'package:estateapp1/features/screens/all/screens/all_recents.dart';
import 'package:estateapp1/features/shimmers/fvertical_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/containers/appbar/fhomeappabrContents.dart';
import '../../common/containers/fprimaryheader_Container.dart';
import '../card/controller/recent_controller.dart';
import '../card/wdigets/fRecentPosted.dart';
import '../card/wdigets/ffavorite_listview_seperated.dart';
import '../favorite_designs/favorite_design_screen.dart';
import '../widgets/fpopular_apartments.dart';
import 'all/screens/all_apartments.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecentController());
    final controllers = Get.put(PopularController());
    final screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  fPrimaryHeaderContainer(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            fHomeAppBar(home: "Home", onTap: () {},),
                            SizedBox(height: 10,),
                            fhomeappabrContents(),
                            SizedBox(height: 30,),

                            /// --- SearchBar -- Tutorial [Section # 3, Video "#3]
                            fSearch_Container(
                                text: "Search your best apartment")
                          ])),

                  SizedBox(height: 10,),

                  fSectionHeading(title: "Recent Posted",
                    showActionButton: true,onPressed: () => Get.to(() => AllRecentApartments(title: "Recent Apartment",
                    query: FirebaseFirestore.instance.collection("RecentEstates").limit(6),
                      futureMethod: controller.FetchAllRecents(),

                    )),
                    buttonTitle: "View all",),

                  /// -- Popular Estates
                  Obx(
                        () {
                      if (controller.isLoading.value)
                        return const fVerticalProductshimmer();
                      if (controller.featuredProducts.isEmpty) {
                        return Center(child: Text("No Data Found!", style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium,));
                      }
                      return GridView.builder(
                          itemCount: 2,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 200,
                            crossAxisSpacing: 3.0,
                            crossAxisCount: 2, mainAxisSpacing: 10,
                          ),
                          itemBuilder: (_, index) => fRecentPosted(recent: controller.featuredProducts[index],));
                    },
                  ),

                  fSectionHeading(title: "Popular apartment",
                    showActionButton: true,onPressed: () => Get.to(() => AllPopularApartments(title: "Popular apartment",
                      query: FirebaseFirestore.instance.collection("PopularEstate").limit(6),
                      futureMethod: controllers.FetchAllProducts(),
                    )),
                    buttonTitle: "View all",),

                  Obx(
                    (){
                      if (controller.isLoading.value)
                        return const fVerticalProductshimmers();
                      if (controllers.featuredPopular.isEmpty) {
                        return Center(child: Text("No Data Found!", style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium,));
                      }
                     return ListView.separated(
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 10,),
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(
                          left: 16.0, // Left space
                          right: 16.0, // Right space
                          bottom: 16.0, // Bottom space
                        ),
                        shrinkWrap: true,
                        itemBuilder: (_, index) => fPopularApartments(popular: controllers.featuredPopular[index],),
                        itemCount: 6,
                      );
                    },
                  )

                ])


        )
    );
  }
}

