import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:market/model/product.dart';

class Api_Manager {
  // Future<Product> getData() async {
  //   final respone = await http.get(
  //     Uri.https("the-closet-api.herokuapp.com", "products"),
  //   );
  //   if (respone.statusCode == 200) {
  //     print(respone.body);
  //     return Product.fromJson(jsonDecode(respone.body));
  //   } else {
  //     throw Exception("Something went wrong");
  //   }
  // }
  var client = http.Client();
  Future<List<Product>> getProduct() async {
    var respone = await client.get(
      Uri.https("the-closet-api.herokuapp.com", "products"),
    );
    if (respone.statusCode == 200) {
      List<dynamic> body = jsonDecode(respone.body);
      List<Product> products = body
          .map(
            (dynamic item) => Product.fromJson(item),
          )
          .toList();
      print(respone.body);
      return products;
    } else {
      throw "Something went wrong";
    }
  }
}
