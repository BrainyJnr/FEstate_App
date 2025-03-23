import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estateapp1/features/model/popular_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PopularRepository extends GetxController {
  static PopularRepository get instance => Get.find();


  /// FireStore Instance for database interaction
  final _db = FirebaseFirestore.instance;

  Future<List<PopularModel>> getPopularProducts() async {
    try {
      final snapshot = await _db.collection("PopularEstate").limit(6).get();
      return snapshot.docs.map((e) => PopularModel.fromSnapshot(e)).toList();

    } on FirebaseAuthException catch (e) {
      throw "";
    } on FirebaseException catch (e) {
      throw "";
    } on FormatException catch (_) {
      throw "";
    } on PlatformException catch (_) {
      throw "";
    } catch (e) {
      throw "Something went wrong. Please try again";

    }
  }
}