import 'dart:convert';

import 'package:estateapp1/data/flocal_storage.dart';
import 'package:estateapp1/features/model/all_model.dart';
import 'package:estateapp1/features/repository/product_repository.dart';
import 'package:get/get.dart';



import 'dart:convert';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  /// RxMap for reactive state
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
      initFavorites();

  }

  /// Initialize favorites from storage
  void initFavorites()  {
    final json = fLocalStorage.instance().readData("favorites");
    if(json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  /// Check if a product is in favorites
  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  /// Toggle favorite status
  void toggleFavoriteProduct(String productId) {
    if(!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      // fLoaders.customToast(message: "Product has been added to the Wishlist.");
    } else {
      fLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      //  fLoaders.customToast(message: "Product has been removed from the Wishlist.");
    }
  }

  /// Save updated favorites to storage
  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    fLocalStorage.instance().saveData("favorites", encodedFavorites);
  }

  /// Fetch favorite products
  Future<List<AllModel>> favoriteProducts() async {
    return await ProductRepository.instance
        .getFavoriteRecentEstate(favorites.keys.toList());
  }
}
