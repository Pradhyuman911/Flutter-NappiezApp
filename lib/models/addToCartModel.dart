// To parse this JSON data, do
//
//     final addToCart = addToCartFromJson(jsonString);

import 'dart:convert';

AddToCart addToCartFromJson(String str) => AddToCart.fromJson(json.decode(str));

String addToCartToJson(AddToCart data) => json.encode(data.toJson());

class AddToCart {
  AddToCart({
    this.message,
    this.errors,
  });

  String message;
  Errors errors;

  factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
        message: json["message"],
        errors: Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors.toJson(),
      };
}

class Errors {
  Errors({
    this.productId,
    this.qty,
    this.price,
  });

  List<String> productId;
  List<String> qty;
  List<String> price;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        productId: List<String>.from(json["product_id"].map((x) => x)),
        qty: List<String>.from(json["qty"].map((x) => x)),
        price: List<String>.from(json["price"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product_id": List<dynamic>.from(productId.map((x) => x)),
        "qty": List<dynamic>.from(qty.map((x) => x)),
        "price": List<dynamic>.from(price.map((x) => x)),
      };
}

// AddToCart addToCartFromJson(String str) => AddToCart.fromJson(json.decode(str));

// String addToCartToJson(AddToCart data) => json.encode(data.toJson());

// class AddToCart {
//   AddToCart({
//     this.message,
//   });

//   String message;

//   factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//       };
// }
