// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:ffi';

import 'package:ecomers_api/model/productModel.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Uri url = Uri.parse('https://fakestoreapi.com/products');
  Future<List<Products>> fetchproduct() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body).cast<Map<String, dynamic>>();
      // print(data);
      var products =
          data.map<Products>((json) => Products.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('failed');
    }

    // print(response.body[0]);
  }

  Future<void> addProduct({
    String? titile,
    double? double,
    String? description,
    String? category,
    String? image,
    Map? rating,
  }) async {
    final response = await http.post(url,
        body: jsonEncode({
          "titile": titile,
          "price": double,
          "description": description,
          "category": category,
          "image": image,
          "rating": rating
        }));
    if (response.statusCode == 200) {
      print(response.body);
    }
  }

  Future<void> updateProduct(
      {String? id, String? titile, double? price}) async {
    final response = await http.put(
      Uri.parse('https://fakestoreapi.com/products/$id'),
      body: jsonEncode(
        <String, dynamic>{
          "titile": titile,
          "price": price,
        },
      ),
    );
    if (response.statusCode == 200) {
      print(response.body);
    }
  }

  Future <void> deleteProduct({String ? id})async{
    final response = await http.delete(Uri.parse('https://fakestoreapi.com/products/$id'));
    if (response.statusCode==200) {
            print(response.body);

    }

  }

}
