// To parse this JSON data, do
//
//     final cartProducts = cartProductsFromJson(jsonString);

import 'dart:convert';

CartProducts cartProductsFromJson(String str) =>
    CartProducts.fromJson(json.decode(str));

String cartProductsToJson(CartProducts data) => json.encode(data.toJson());

class CartProducts {
  CartProducts({
    this.cartitems,
    this.totalProduct,
  });

  List<Cartitem> cartitems;
  int totalProduct;

  factory CartProducts.fromJson(Map<String, dynamic> json) => CartProducts(
        cartitems: List<Cartitem>.from(
            json["cartitems"].map((x) => Cartitem.fromJson(x))),
        totalProduct: json["TotalProduct"],
      );

  Map<String, dynamic> toJson() => {
        "cartitems": List<dynamic>.from(cartitems.map((x) => x.toJson())),
        "TotalProduct": totalProduct,
      };
}

class Cartitem {
  Cartitem({
    this.id,
    this.productName,
    this.userId,
    this.sessionKey,
    this.sessionId,
    this.productId,
    this.productOption,
    this.productOptionId,
    this.price,
    this.productPrice,
    this.qty,
    this.createdAt,
    this.updatedAt,
    this.totalPrice,
    this.cartOptions,
    this.products,
  });

  int id;
  String productName;
  String userId;
  String sessionKey;
  dynamic sessionId;
  int productId;
  dynamic productOption;
  dynamic productOptionId;
  int price;
  int productPrice;
  int qty;
  DateTime createdAt;
  DateTime updatedAt;
  int totalPrice;
  List<dynamic> cartOptions;
  Products products;

  factory Cartitem.fromJson(Map<String, dynamic> json) => Cartitem(
        id: json["id"],
        productName: json["product_name"],
        userId: json["user_id"],
        sessionKey: json["session_key"],
        sessionId: json["session_id"],
        productId: json["product_id"],
        productOption: json["product_option"],
        productOptionId: json["product_option_id"],
        price: json["price"],
        productPrice: json["product_price"],
        qty: json["qty"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        totalPrice: json["totalPrice"],
        cartOptions: List<dynamic>.from(json["cart_options"].map((x) => x)),
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "user_id": userId,
        "session_key": sessionKey,
        "session_id": sessionId,
        "product_id": productId,
        "product_option": productOption,
        "product_option_id": productOptionId,
        "price": price,
        "product_price": productPrice,
        "qty": qty,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "totalPrice": totalPrice,
        "cart_options": List<dynamic>.from(cartOptions.map((x) => x)),
        "products": products.toJson(),
      };
}

class Products {
  Products({
    this.id,
    this.catId,
    this.isFeatured,
    this.isLatest,
    this.name,
    this.productAvailability,
    this.retailPrice,
    this.offerPrice,
    this.description,
    this.coverPhoto,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
  });

  int id;
  int catId;
  String isFeatured;
  dynamic isLatest;
  String name;
  String productAvailability;
  int retailPrice;
  dynamic offerPrice;
  String description;
  String coverPhoto;
  String active;
  DateTime createdAt;
  DateTime updatedAt;
  String imagePath;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        catId: json["cat_id"],
        isFeatured: json["isFeatured"],
        isLatest: json["isLatest"],
        name: json["name"],
        productAvailability: json["product_availability"],
        retailPrice: json["retail_price"],
        offerPrice: json["offer_price"],
        description: json["description"],
        coverPhoto: json["cover_photo"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imagePath: json["ImagePath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_id": catId,
        "isFeatured": isFeatured,
        "isLatest": isLatest,
        "name": name,
        "product_availability": productAvailability,
        "retail_price": retailPrice,
        "offer_price": offerPrice,
        "description": description,
        "cover_photo": coverPhoto,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "ImagePath": imagePath,
      };
}
