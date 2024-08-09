import 'package:flutter/material.dart';

import '../model/productModel.dart';

class WishlistController extends ChangeNotifier{

  final List<Product> _wishitems = [];

  List<Product> get wishitems => _wishitems;


  void addItem(Product item){
    _wishitems.add(item);
    notifyListeners();
  }

  void removeItem(Product item){
    _wishitems.remove(item);
    notifyListeners();
  }

}