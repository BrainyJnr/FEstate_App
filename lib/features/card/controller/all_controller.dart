import 'package:estateapp1/common/widgets/loader/floader.dart';
import 'package:estateapp1/features/model/all_model.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:estateapp1/features/repository/product_repository.dart';
import 'package:get/get.dart';


class All_Controller extends GetxController {
  static All_Controller get instance => Get.find();

  final isLoading = false.obs;
  final allRepository = Get.put(ProductRepository());
  RxList<RecentModel> featuredAll = <RecentModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedAll();
    super.onInit();
  }

  void fetchFeaturedAll() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final all = await allRepository.getAllRecent();

      // Assign Products
      featuredAll.assignAll(all);
    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getAllPrice(AllModel all) {
    double recentPrice = all.price ?? 0;
    if (recentPrice == 0) {
      return "Price empty";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}