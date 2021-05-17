import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.vouchers,
    required this.delivery,
    required this.deliveryPrice,
    required this.postDate,
  });

  String id;
  String image;
  String title;
  int price;
  String description;
  String vouchers;
  String delivery;
  int deliveryPrice;
  DateTime postDate;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        image: json["image"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        vouchers: json["vouchers"],
        delivery: json["delivery"],
        deliveryPrice: json["deliveryPrice"],
        postDate: DateTime.parse(json["postDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "title": title,
        "price": price,
        "description": description,
        "vouchers": vouchers,
        "delivery": delivery,
        "deliveryPrice": deliveryPrice,
        "postDate": postDate.toIso8601String(),
      };
}
