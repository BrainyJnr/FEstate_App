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

  Future<List<PopularModel>> getAllPopularProducts() async {
    try {
      final snapshot = await _db.collection("PopularEstate").get();
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

  Future<List<PopularModel>> fetchPopularApartmentsByQuery(Query query) async {
    try {

      final querySnapshot = await query.get();
      final List<PopularModel> popularList = querySnapshot.docs.map((doc) => PopularModel.fromQuerySnapshot(doc)).toList();
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

  Future<List<PopularModel>> getFavoritePopularEstate(List<String> popularId) async {
    try {
      // Fetch from "Foods" collection
      final foodSnapshot = await _db
          .collection("PopularEstate")
          .where(FieldPath.documentId, whereIn: popularId)
          .get();

      // Fetch from "Drinks" collection
      final CrunchesSnapshot = await _db
          .collection("PopularEstate")
          .where(FieldPath.documentId, whereIn: popularId)
          .get();

      // Map both snapshots to AllModel and combine them
      final foodItems = foodSnapshot.docs
          .map((querySnapshot) => PopularModel.fromSnapshot(querySnapshot))
          .toList();

      final drinkItems = CrunchesSnapshot.docs
          .map((querySnapshot) => PopularModel.fromSnapshot(querySnapshot))
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