import 'package:easyshop/controller/allProductsController.dart';
import 'package:easyshop/controller/cartController.dart';
import 'package:easyshop/controller/whishlistController.dart';
import 'package:easyshop/model/productModel.dart';
import 'package:easyshop/utils/mytexts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/mycolors.dart';

class ProductDetails extends StatelessWidget {

  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  // Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  // List<Review>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  // Meta? meta;
  String? images;
  String? thumbnail;
  Product? p;
  int? count;


  ProductDetails({super.key,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    // this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    //this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    //this.meta,
    this.images,
    this.thumbnail,
    this.p,
    this.count
  });

  @override
  Widget build(BuildContext context) {
    var productslist = context.watch<ProductProvider>().allProducts.products;
   // var product = productslist[]
   // final detailpagecontroller = Provider.of<DetailPageController>(context);
    CartController cartController = Provider.of<CartController>(context);
    WishlistController wishlistController = Provider.of<WishlistController>(context);
   // var singleproduct = productslist
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.basicColor,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(images!,fit: BoxFit.cover,),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Text(title!,
                         style: MyTexts.titleText,),
                  MaterialButton(
                    onPressed: (){
                      wishlistController.addItem(p!);
                    },
                    minWidth: MediaQuery.of(context).size.width*0.10,
                    child: Icon(
                      // detailpagecontroller.isFavorite ?
                      wishlistController.wishitems.contains(p) ?
                      Icons.favorite : Icons.favorite_border,
                      color:
                      wishlistController.wishitems.contains(p) ?
                      Colors.red : null,
                    ),),
                ],
              ),
              const SizedBox(height: 10,),
              Text(description!,style: MyTexts.bodyText,),
              const SizedBox(height: 8,),
              Text("\$ $price",
                          style: MyTexts.priceText,),
              const SizedBox(height: 8,),

              Text("Rating: $rating",style: MyTexts.bodyText,),
              const SizedBox(height: 8,),
              //if(discountPercentage != null)
              Text("$discountPercentage% Discount!",style: MyTexts.discount,),
              const SizedBox(height: 8,),
              Text("In Stock : $stock",style: MyTexts.bodyText),
              const SizedBox(height: 8,),
              Text("Shipping: $shippingInformation",style: MyTexts.bodyText),
              const SizedBox(height: 8,),
              Text("Warranty: $warrantyInformation",style: MyTexts.bodyText),
              const SizedBox(height: 8,),
              Text("Return Policy: $returnPolicy",style: MyTexts.bodyText),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                      onPressed: (){
                        //count=0;
                        if(cartController.items.contains(title) != true){
                          cartController.addItem(p!);
                          print(cartController.items);
                        }
                      },
                    shape: const Border.fromBorderSide(BorderSide(width: 2,color: Colors.grey)),
                    minWidth: MediaQuery.of(context).size.width*0.45,
                    child:  Text(cartController.items.contains(p) ? "Added To Cart" : "Add to Cart"),),

                  MaterialButton(
                      onPressed: (){},
                    color: Colors.yellow[800],
                    minWidth: MediaQuery.of(context).size.width*0.45,
                    child: Text("Buy Now"),
                  )
                ],
              ),
              SizedBox(height: 75,)
            ],
          ),
        ),
      ),
    );
  }
}

