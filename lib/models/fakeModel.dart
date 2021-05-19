// To parse this JSON data, do
//
//     final fakeModel = fakeModelFromJson(jsonString);

import 'dart:convert';

FakeModel fakeModelFromJson(String str) => FakeModel.fromJson(json.decode(str));

String fakeModelToJson(FakeModel data) => json.encode(data.toJson());

class FakeModel {
  FakeModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  int id;
  String title;
  double price;
  String description;
  String category;
  String image;

  factory FakeModel.fromJson(Map<String, dynamic> json) => FakeModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      };
}
