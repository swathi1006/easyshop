import 'package:flutter/material.dart';
import '../model/productModel.dart';


class CartController extends ChangeNotifier{

final List<Product> _items = [];

List<Product> get items => _items;

// int count = 0;

void addItem(Product item){
  _items.add(item);
  notifyListeners();
}

void removeItem(Product item){
  _items.remove(item);
  notifyListeners();
}

// double getCartTotal(){
//   return _items.fold(0.0, (previousvalue,item) => previousvalue + item.price!);
// }

bool isFavorite = false;
bool addedToCart = false;

void toggleFavorite() {
  isFavorite = !isFavorite;
  notifyListeners();
}

void incrementCount(int count) {
  if(count == null){
    count = 0;
  }else{
  count++;}
  print(count);
  notifyListeners();
}
  void decrementCount(int count) {
  count--;
  notifyListeners();
  }

}

