import 'package:estateapp1/features/model/recent_model.dart';
import 'package:get/get.dart';

class RecentImageController extends GetxController {
  // Singleton pattern to access the controller instance
  static RecentImageController get instance => Get.find();

  // Observable for selected food image
  RxString selectedRecentEstate = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getRecentImages(RecentModel recent) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Check if the food image is not null or empty
    if (recent.image != null && recent.image.isNotEmpty) {
      // Load thumbnail image
      images.add(recent.image);

      // Assign Thumbnail as Selected Image
      selectedRecentEstate.value = recent.image;
    }

    // Return images as a list
    return images.toList();
  }
}
