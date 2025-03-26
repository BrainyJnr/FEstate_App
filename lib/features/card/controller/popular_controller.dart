import 'package:estateapp1/common/widgets/loader/floader.dart';
import 'package:estateapp1/features/model/popular_model.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:estateapp1/features/repository/product_repository.dart';
import 'package:get/get.dart';

import '../../repository/popular_repository.dart';

class PopularController extends GetxController {
  static PopularController get instance => Get.find();

  final isLoading = false.obs;
  final popularRepository = Get.put(PopularRepository());
  RxList<PopularModel> featuredPopular = <PopularModel>[].obs;

  @override
  void onInit() {
    FetchProducts();
    super.onInit();
  }

  void FetchProducts() async {
    try {
      isLoading.value = true;

      final popular = await popularRepository.getPopularProducts();

      featuredPopular.assignAll(popular);
    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<PopularModel>> FetchAllProducts() async {
    try {

      final popular = await popularRepository.getAllPopularProducts();
      return popular;
    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }


  String getPopularPrice(PopularModel recent) {
    double recentPrice = recent.price ?? 0;
    if (recentPrice == 0) {
      return "Price Empty";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }

}