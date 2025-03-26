import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/containers/appbar/fAppBar.dart';
import '../../../../common/utilis/sizes.dart';
import '../../../../function/fcloud_helper_function.dart';
import '../../../shimmers/fvertical_shimmer.dart';
import '../controller/all_popular_apartments_controller.dart';
import '../controller/all_recent_controller.dart';
import '../widgets/fsorateble_recent.dart';


class AllRecentApartments extends StatelessWidget {
  const AllRecentApartments({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<RecentModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllRecentController());
    return Scaffold(
      appBar: fAppBar(
        title: Text(title),showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchRecentByQuery(query),
              builder: (context, snapshot) {
                const loader = fVerticalProductshimmer();
                final widget = fCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                // Return appropriate widget based  on snapshot state
                if(widget != null) return widget;


                // Products Found!
                final products = snapshot.data!;
                return fSortableRecentApartments(products: products,);
              }),),
    );
  }
}
