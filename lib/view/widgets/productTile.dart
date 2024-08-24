import 'package:easyshop/view/widgets/productDetailsView.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easyshop/model/productModel.dart';
import 'package:provider/provider.dart';

import '../../controller/cartController.dart';


class ProductTileAPI extends StatelessWidget {

  String? title;
  double? price;
  String? category;
  String? image;
  String? description;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? warrantyInformation;
  String? shippingInformation;
  String? returnPolicy;
  Product? p;
  int? count;

  ProductTileAPI({super.key,
    this.description,
    this.title,
    this.price,
    this.category,
    this.image,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.warrantyInformation,
    this.shippingInformation,
    this.returnPolicy,
    this.p,
    this.count
  });

  @override
  Widget build(BuildContext context) {
    CartController cartController = Provider.of<CartController>(context);
    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetails(
              images: image,
              title: title,
              price: price,
              description: description,
              rating: rating,
              discountPercentage: discountPercentage,
              stock: stock,
              warrantyInformation: warrantyInformation,
              returnPolicy: returnPolicy,
              shippingInformation: shippingInformation,
              p: p,
              count: count,
            )));
      },
      child: Card(
        child: Container(
          // height: 250,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Image.network(image!,fit: BoxFit.cover,
                    height: 120,width: 120,)),
                  SizedBox(height: 10,),
                  Text(title!,),
                  SizedBox(height: 5,),
                  Text(category!),
                  SizedBox(height: 5,),
                  Text("\$$price"),
                  SizedBox(height: 5,),
                  MaterialButton(
                    onPressed: (){
                      //count=0;
                      if(cartController.items.contains(title) != true){
                        cartController.addItem(p!);
                        print(cartController.items);
                      }
                    },
                    //shape: const Border.fromBorderSide(BorderSide(width: 2,color: Colors.grey)),
                    minWidth: 100,
                    color: Colors.deepPurpleAccent[100],
                    child:  Text(cartController.items.contains(p) ? "Added To Cart" : "Add to Cart"),),
                ],
              ),
            )
        ),
      ),
    );
  }
}
