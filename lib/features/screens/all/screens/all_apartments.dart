import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estateapp1/common/containers/appbar/fAppBar.dart';
import 'package:estateapp1/common/utilis/sizes.dart';
import 'package:estateapp1/features/shimmers/fvertical_shimmer.dart';
import 'package:estateapp1/function/fcloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/popular_model.dart';
import '../controller/all_popular_apartments_controller.dart';
import '../widgets/fsortable_apartments.dart';

class AllPopularApartments extends StatelessWidget {
  const AllPopularApartments({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<PopularModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllPopularApartmentController());
    return Scaffold(
      appBar: fAppBar(
        title: Text(title),showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(fSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchPopularByQuery(query),
              builder: (context, snapshot) {
                const loader = fVerticalProductshimmer();
                final widget = fCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                // Return appropriate widget based  on snapshot state
                if(widget != null) return widget;


                // Products Found!
                final products = snapshot.data!;
                return fSortablePopularApartments(products: products,);
              }),),
      ),
    );
  }
}
