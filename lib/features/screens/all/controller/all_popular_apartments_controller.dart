import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estateapp1/common/widgets/loader/floader.dart';
import 'package:estateapp1/features/model/popular_model.dart';
import 'package:estateapp1/features/repository/popular_repository.dart';
import 'package:get/get.dart';

class AllPopularApartmentController extends GetxController {
  static AllPopularApartmentController get instance => Get.find();

  final repository = PopularRepository.instance;
  final RxList<PopularModel> popular = <PopularModel>[].obs;

  Future<List<PopularModel>> fetchPopularByQuery(Query? query) async {
    try {
      if(query == null) return [];

      final products = await repository.fetchPopularApartmentsByQuery(query);

      return products;
    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }
}