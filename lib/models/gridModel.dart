// To parse this JSON data, do
//
//     final gridModel = gridModelFromJson(jsonString);

import 'dart:convert';

GridModel gridModelFromJson(String str) => GridModel.fromJson(json.decode(str));

String gridModelToJson(GridModel data) => json.encode(data.toJson());

class GridModel {
  GridModel({
    this.id,
    this.image,
    this.title,
    this.price,
    this.promotionPrice,
    this.color,
    this.size,
  });

  int id;
  String image;
  String title;
  int price;
  double promotionPrice;
  List<Color> color;
  List<Color> size;

  factory GridModel.fromJson(Map<String, dynamic> json) => GridModel(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        price: json["price"],
        promotionPrice: json["promotionPrice"].toDouble(),
        color: List<Color>.from(json["color"].map((x) => Color.fromJson(x))),
        size: List<Color>.from(json["size"].map((x) => Color.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "price": price,
        "promotionPrice": promotionPrice,
        "color": List<dynamic>.from(color.map((x) => x.toJson())),
        "size": List<dynamic>.from(size.map((x) => x.toJson())),
      };
}

class Color {
  Color({
    this.id,
    this.value,
  });

  int id;
  String value;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
