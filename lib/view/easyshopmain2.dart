import 'package:easyshop/utils/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/bottomNavController.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],

      bottomNavigationBar: Container(
       // padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(15),
          color: MyColors.basicColor,),
        child: BottomNavigationBar(
          currentIndex:
          Provider.of<BottomNavController>(context).selectedIndex,
          onTap: Provider.of<BottomNavController>(context,listen: false).onItemTap,
          //elevation: 0,
          backgroundColor: MyColors.basicColor,
          selectedIconTheme: IconThemeData(
              color: MyColors.basicColor,
              size: 25),
          unselectedIconTheme: IconThemeData(
            size: 25,),
          unselectedItemColor: Colors.grey,
          selectedItemColor: MyColors.basicColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart"),

          ],
        ),
      ),
    );
  }
}
