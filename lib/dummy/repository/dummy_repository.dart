import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estateapp1/features/model/popular_model.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/ffirebase_storage.dart';

class DummyRepository extends GetxController {
  final _db = FirebaseFirestore.instance;

  Future<void> uploadDummydata(List<PopularModel> PopularEstate) async {
    try {
      final storage = Get.put(fFirebaseStorageService());

      for (var item in PopularEstate) {
        final file = await storage.getImageDataFromAssets(item.image);

        final url = await storage.uploadImageData("PopularEstate", file, item.title);

        item.image = url;

        await _db.collection("PopularEstate").doc(item.id).set(item.toJson());
      }
    } on FirebaseException catch (e) {
      throw "========$e=======here";
    } on PlatformException catch (e) {
      throw "===========$e=====================";
    } catch (e) {
      throw "Something went wrong $e";
    }
  }
}
