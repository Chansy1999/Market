import 'dart:convert';

import 'package:market/model/product.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Product> getProducts() async {
    var client = http.Client();
    var productModel = null;

    try {
      var respone = await client.get(
        Uri.http("https://the-closet-api.herokuapp.com", "products"),
      );
      if (respone.statusCode == 200) {
        var jsonString = respone.body;
        var jsonMap = json.decode(jsonString);

        productModel = Product.fromJson(jsonMap);
      }
    } catch (ex) {
      return productModel;
    }

    return productModel;
  }
}
