import 'package:easyshop/controller/bottomNavController.dart';
import 'package:easyshop/controller/cartController.dart';
import 'package:easyshop/controller/whishlistController.dart';
import 'package:easyshop/view/category_screen.dart';
import 'package:easyshop/view/easyshophome.dart';
import 'package:easyshop/view/easyshopmain2.dart';
import 'package:easyshop/view/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/allProductsController.dart';
import 'controller/categoryController.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CategoryController()),
        ChangeNotifierProvider(create: (context) => BottomNavController()),
        ChangeNotifierProvider(create: (context) => WishlistController()),
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       // home: HomeProductList(),
        //home: CategoryScreen(),
        home: LoginPage(),
        //home: MainPage(),
      ),
    );
  }
}
