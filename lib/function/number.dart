import 'package:cloud_firestore/cloud_firestore.dart';

String? DriverphoneNumber; // Nullable variable

Future<void> fetchPhoneNumber(String userId) async {
  final doc = await FirebaseFirestore.instance.collection("RecentEstates").doc(userId).get();
  if (doc.exists) {
    DriverphoneNumber = doc.data()?["PhoneNumber"] ?? "";
    print("Fetched phone number: $DriverphoneNumber");
  }
}
