import 'package:estateapp1/features/model/popular_model.dart';
import 'package:estateapp1/features/screens/all/controller/all_popular_apartments_controller.dart';
import 'package:estateapp1/features/shimmers/fvertical_shimmer.dart';
import 'package:estateapp1/features/widgets/fpopular_apartments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class fSortablePopularApartments extends StatelessWidget {
  const fSortablePopularApartments({super.key, required this.products});

  final List<PopularModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllPopularApartmentController());

    // Assign fetched products to the controller's list
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.popular.assignAll(products);
    });

    return Column(
      children: [
        Obx(
                () => ListView.separated(
            separatorBuilder: (context, index) =>
            const SizedBox(height: 10,),
            scrollDirection: Axis.vertical,shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.popular.length,
            itemBuilder: (_, index) => fPopularApartments(popular: controller.popular[index]))),
      ],
    );
  }}

