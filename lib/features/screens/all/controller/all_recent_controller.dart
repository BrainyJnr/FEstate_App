import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:estateapp1/features/repository/product_repository.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loader/floader.dart';


class AllRecentController extends GetxController {
  static AllRecentController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxList<RecentModel> popular = <RecentModel>[].obs;

  Future<List<RecentModel>> fetchRecentByQuery(Query? query) async {
    try {
      if(query == null) return [];

      final products = await repository.fetchRecentByQuery(query);

      return products;
    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }
}