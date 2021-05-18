import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:market/model/product.dart';

class Api_Manager {
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
      print(products);
      return products;
    } else {
      throw "Something went wrong";
    }
  }
}
