import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/productModel.dart';

class ProductProvider with ChangeNotifier {
  AllProducts allProducts = AllProducts();

  bool isLoading = false;
  List<dynamic> _productList = [];

  List<dynamic> get productList => _productList;

  fetchData() async{
    isLoading = true;

    final url = "https://dummyjson.com/products";
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    Map<String,dynamic> decodeData = {};
    if (response.statusCode == 200){
      decodeData = jsonDecode(response.body);
    }else{
      print("Api failed");
    }
    allProducts = AllProducts.fromJson(decodeData);
    isLoading = false;
    notifyListeners();
  }

}
