import 'package:cloud_firestore/cloud_firestore.dart';

class PopularModel {
  String id;
  String image;
  double? price;
  String title;
  String? location;
  String? description;

  PopularModel ({

    required this.image,
    required this.id,
    required this.title,
    this.location,
    this.price,
    this.description,
  });

  static PopularModel empty() => PopularModel(
    image: "",
    id: "",
    title: "",
    location: "",
    price: 0,
  );

  /// Json Format
  toJson() {
    return {
      "Image": image,
      "Title": title,
      "Id": id,
      "Location": location,
      "Price": price,
      "Description": description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory PopularModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return PopularModel.empty();
    final data = document.data()!;
    return PopularModel(
      id: document.id,
      title: data["Title"],
      location: data["Location"],
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      //isAvailable: data['isAvailable'] == true,

    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory PopularModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return PopularModel(
      id: document.id,
      title: data["Title"],
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      location: data["Location"],
      //isAvailable: data['isAvailable'] == true, // Adjusted this line

    );
  }

  factory PopularModel.fromData(Map<String, dynamic> data) {
    return PopularModel(
      title: data['Title'] ?? '',
      price: data['Price']?.toDouble() ?? 0.0,
      image: data["Image"], id: "",
      // Parse other fields
    );
  }
}