import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/all_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();


  /// FireStore Instance for database interaction
   final _db = FirebaseFirestore.instance;

   Future<List<RecentModel>> getRecentProducts() async {
     try {
       final snapshot = await _db.collection("RecentEstates").limit(2).get();
       return snapshot.docs.map((e) => RecentModel.fromSnapshot(e)).toList();

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


  Future<List<RecentModel>> getAllRecent() async {
    try {
      final snapshot = await _db.collection("RecentEstates").get();
      return snapshot.docs.map((e) => RecentModel.fromSnapshot(e)).toList();

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


  Future<List<RecentModel>> fetchRecentByQuery(Query query) async {
    try {

      final querySnapshot = await query.get();
      final List<RecentModel> popularList = querySnapshot.docs.map((doc) => RecentModel.fromQuerySnapshot(doc)).toList();
      return popularList;
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

  Future<List<AllModel>> getFavoriteRecentEstate(List<String> productIds) async {
    try {
      // Fetch from "Foods" collection
      final foodSnapshot = await _db
          .collection("RecentEstates")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Fetch from "Drinks" collection
      final CrunchesSnapshot = await _db
          .collection("PopularEstate")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Map both snapshots to AllModel and combine them
      final foodItems = foodSnapshot.docs
          .map((querySnapshot) => AllModel.fromSnapshot(querySnapshot))
          .toList();

      final drinkItems = CrunchesSnapshot.docs
          .map((querySnapshot) => AllModel.fromSnapshot(querySnapshot))
          .toList();

      // Combine the two lists
      return [...foodItems, ...drinkItems];
    } on FirebaseException catch (e) {
      throw "Error: $e";
    } on PlatformException catch (e) {
      throw "Platform Error: $e";
    } catch (e) {
      throw "Unknown Error: $e";
    }
  }


}