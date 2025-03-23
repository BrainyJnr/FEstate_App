import 'package:estateapp1/common/widgets/loader/floader.dart';
import 'package:estateapp1/features/repository/product_repository.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/recent_model.dart';

class RecentController extends GetxController {
  static RecentController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<RecentModel> featuredProducts = <RecentModel>[].obs;

  @override
  void onInit() {
    FetchProducts();
    super.onInit();
  }

  void FetchProducts() async {
    try {
      isLoading.value = true;

      final products = await productRepository.getRecentProducts();

      featuredProducts.assignAll(products);
    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getRecentPrice(RecentModel recent) {
    double recentPrice = recent.price ?? 0;
    if (recentPrice == 0) {
      return "Price Empty";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}


void makePhoneCall(String phoneNumber) async {
  final Uri phoneUri = Uri.parse("tel:$phoneNumber");

  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    print("❌ Could not launch dialer");
  }
}
