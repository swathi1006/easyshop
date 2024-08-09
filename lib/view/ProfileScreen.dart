import 'package:easyshop/utils/mycolors.dart';
import 'package:easyshop/view/wishlistScreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       automaticallyImplyLeading: false,
       backgroundColor: MyColors.basicColor,
       title: Text("Profile",
         style: TextStyle(color: Colors.white),),
     ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:10),
            CircleAvatar(
              child: Icon(Icons.person,size: 70,),
              radius: 60,
            ),
            SizedBox(height: 15,),
            Card(child: ListTile(title:  Center(child: Text("Orders",style: TextStyle(fontSize: 20),)))),
            Card(child: ListTile(
                title: Center(child: Text("Whishlist",style: TextStyle(fontSize: 20),)),
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen()));
              },
            ))
          ],
        ),
      ),
    );
  }
}
