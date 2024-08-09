import 'package:easyshop/controller/whishlistController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/mycolors.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var productsWishlisted = context.watch<WishlistController>().wishitems;

    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: MyColors.basicColor,
        title: Text("Wishlist",
            style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
              child: Consumer<WishlistController>(
                  builder: (context,wishlistController,child){
                    return  GridView.builder(
                        itemCount: wishlistController.wishitems.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.8,
                            mainAxisSpacing: 0.2,
                            crossAxisCount: 2),
                        itemBuilder: (context,index){
                          var item = productsWishlisted[index];
                          return Card(
                            child: Container(
                              // height: 250,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(child: Image.network(item.images![0],fit: BoxFit.cover,
                                        height: 120,width: 120,)),
                                      SizedBox(height: 10,),
                                      Text(item.title!,),
                                      SizedBox(height: 5,),
                                      Text(item.category!),
                                      SizedBox(height: 5,),
                                      Text("\$${item.price}"),
                                      SizedBox(height: 5,),
                                      MaterialButton(onPressed: (){
                                        Provider.of<WishlistController>(context,listen: false).removeItem(item);
                                      },
                                        color: Colors.deepPurpleAccent,
                                        minWidth: 100,
                                      child: Text("Remove"),)
                                    ],
                                  ),
                                )
                            ),
                          );
                        });
                  }))
        ],
      ),
    );
  }
}
