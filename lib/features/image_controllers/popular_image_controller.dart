import 'package:estateapp1/features/model/popular_model.dart';
import 'package:get/get.dart';

class PopularImageController extends GetxController {
  // Singleton pattern to access the controller instance
  static PopularImageController get instance => Get.find();

  // Observable for selected food image
  RxString selectedPopularEstate = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getPopularImages(PopularModel popular) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Check if the food image is not null or empty
    if (popular.image != null && popular.image.isNotEmpty) {
      // Load thumbnail image
      images.add(popular.image);

      // Assign Thumbnail as Selected Image
      selectedPopularEstate.value = popular.image;
    }

    // Return images as a list
    return images.toList();
  }
}

