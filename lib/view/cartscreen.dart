import 'package:easyshop/controller/cartController.dart';
import 'package:easyshop/view/easyshopmain2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/mycolors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {


    var productsInCart = context.watch<CartController>().items;
    num totalAmount = 0;
    for (var item in productsInCart) {
      totalAmount += item.price! ;
      //totalAmount += (item.price! * item.count!);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.basicColor,
        title: Text("Cart",
            style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartController>(
                builder: (context, cartController, child){
              return  ListView.builder(

                  itemCount: cartController.items.length,
                  itemBuilder: (context,index){

                    var item = productsInCart[index];
            
                    return ListTile(
                      //minTileHeight: 150,
                      leading: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(item.images![0]),fit: BoxFit.cover)
                        ),
                      ),
                      title: Text(item.title!),
                      subtitle: Text("\$ ${item.price}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // IconButton(onPressed: (){
                          //   Provider.of<CartController>(context,listen: false).decrementCount(item.count!);
                          // },
                          //     icon: Icon(Icons.remove)),

                         // Text(
                         //    "${item.count}",style: TextStyle(fontSize: 20),),

                          // IconButton(onPressed: (){
                          //   Provider.of<CartController>(context,listen: false).incrementCount(item.count!);
                          // },
                          //     icon: Icon(Icons.add)),
                          // SizedBox(width: 15,),
                          IconButton(onPressed: (){
                            Provider.of<CartController>(context,listen: false).removeItem(item);
                          },
                             icon: Icon(Icons.delete_outline)),
                        ],
                      ),
                    );
                  });
                 
            }),
          ),
         // SizedBox(height: 30,),
          Text("Total Price :  \$ $totalAmount",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          MaterialButton(onPressed: (){},
          color: MyColors.basicColor,
            minWidth: 130,
            child: Text("Pay Now",style: TextStyle(color: Colors.white,fontSize: 15),),
          ),
          SizedBox(height: 100,),
        ],
      ),
    );
  }
}


