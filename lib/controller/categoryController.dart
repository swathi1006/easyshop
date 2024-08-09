import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/productModel.dart';

class CategoryController with ChangeNotifier{

  AllProducts allProducts = AllProducts();

  List<String> categoryList = [
    "Beauty",
    "Fragrances",
    "Furniture",
    "Groceries",
    "Home-decoration",
    "Kitchen-accessories",
    "Laptops",
    "Mens-shirts",
    "Mens-shoes",
    "Mens-watches",
    "Mobile-accessories",
    "Motorcycle",
    "Skin-care",
    "Smartphones",
    "Sports-accessories",
    "Sunglasses",
    "Tablets",
    "Tops",
    "Vehicle",
    "Womens-bags",
    "Womens-dresses",
    "Womens-jewellery",
    "Womens-shoes",
    "Womens-watches",
  ];
  String category = "beauty";

  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  //late AllProducts allProducts;

  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    final url = Uri.parse("https://dummyjson.com/products/category/$category");
    print(url);
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};
    if(response.statusCode == 200){
      decodedData = jsonDecode(response.body);
    }else{
      print("Api failed");
    }

    allProducts = AllProducts.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}