import 'package:easyshop/view/ProfileScreen.dart';
import 'package:easyshop/view/cartscreen.dart';
import 'package:easyshop/view/easyshophome.dart';
import 'package:flutter/material.dart';

import '../view/category_screen.dart';
import '../view/searchscreen.dart';

class BottomNavController with ChangeNotifier{

  int selectedIndex = 0;

  void onItemTap(index){
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    HomeProductList(),
    CategoryScreen(),
    ProfileScreen(),
    CartScreen(),
  ];

}