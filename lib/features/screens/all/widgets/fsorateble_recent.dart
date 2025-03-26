import 'package:estateapp1/features/card/wdigets/fRecentPosted.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:estateapp1/features/screens/all/controller/all_recent_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../shimmers/fvertical_shimmer.dart';


class fSortableRecentApartments extends StatelessWidget {
  const fSortableRecentApartments({super.key, required this.products});

  final List<RecentModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllRecentController());

    // Assign fetched products to the controller's list
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.popular.assignAll(products);
    });

    return Column(
      children: [
        Obx(() =>  fGridlayout(itemCount: controller.popular.length, itemBuilder: (_, index) =>
             fRecentPosted(recent: controller.popular[index])),
            )
      ],
    );
  }}
