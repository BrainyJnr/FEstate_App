import 'package:cloud_firestore/cloud_firestore.dart';


class AllModel {
  String id;
  String image;
  double? price;
  String title;
  String location;
  String? description;
  String? phoneNumber;
  String? userImage;
  String? ownerName;

  AllModel(
      {required this.image,
        required this.id,
        required this.title,
        required this.location,
        this.price,
        this.description,
        this.phoneNumber,
        this.ownerName,
        this.userImage});

  static AllModel empty() => AllModel(
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
      "UserImage": userImage,
      "OwnerName": ownerName,
      "Title": title,
      "Id": id,
      "Location": location,
      "Price": price,
      "Description": description,
      "PhoneNumber": phoneNumber,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory AllModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return AllModel.empty();
    final data = document.data()!;
    return AllModel(
      id: document.id,
      ownerName: data["OwnerName"],
      title: data["Title"],
      phoneNumber: data["PhoneNumber"],
      location: data["Location"],
      image: data["Image"],
      userImage: data["UserImage"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      //isAvailable: data['isAvailable'] == true,
    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory AllModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return AllModel(
      id: document.id,
      ownerName: data["OwnerName"],
      title: data["Title"],
      image: data["Image"],
      userImage: data["UserImage"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      phoneNumber: data["PhoneNumber"],
      location: data["Location"],
      //isAvailable: data['isAvailable'] == true, // Adjusted this line
    );
  }

  factory AllModel.fromData(Map<String, dynamic> data) {
    return AllModel(
      title: data['Title'] ?? '',
      price: data['Price']?.toDouble() ?? 0.0,
      image: data["Image"],
      userImage: data["UserImage"],
      id: "", location: data["Location"] ?? "",
      // Parse other fields
    );
  }
}
