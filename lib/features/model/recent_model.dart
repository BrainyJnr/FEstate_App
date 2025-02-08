import 'package:cloud_firestore/cloud_firestore.dart';

class RecentModel {
  String id;
  String image;
  double? price;
  String title;
  String? location;
  String? description;

   RecentModel ({

  required this.image,
  required this.id,
  required this.title,
   this.location,
  this.price,
  this.description,
  });

  static RecentModel empty() => RecentModel(
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
  factory RecentModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return RecentModel.empty();
    final data = document.data()!;
    return RecentModel(
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
  factory RecentModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return RecentModel(
      id: document.id,
      title: data["Title"],
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      location: data["Location"],
      //isAvailable: data['isAvailable'] == true, // Adjusted this line

    );
  }

  factory RecentModel.fromData(Map<String, dynamic> data) {
    return RecentModel(
      title: data['Title'] ?? '',
      price: data['Price']?.toDouble() ?? 0.0,
      image: data["Image"], id: "",
      // Parse other fields
    );
  }
}
