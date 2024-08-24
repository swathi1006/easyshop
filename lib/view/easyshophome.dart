import 'package:easyshop/utils/mycolors.dart';
import 'package:easyshop/view/widgets/productTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/allProductsController.dart';


class HomeProductList extends StatelessWidget {

  void fetchData(BuildContext context){
    Provider.of<ProductProvider>(context,listen: false)
        .fetchData();
  }

  @override
  Widget build(BuildContext context) {

    fetchData(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Products",style: TextStyle(color: Colors.white),),
        backgroundColor: MyColors.basicColor,
      ),
      body:

      Consumer<ProductProvider>(
          builder: (context,provider,child) {
            return provider.isLoading == true
                ? const Center(
              child: Text("loading"),
            )
                : Padding(padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: provider.allProducts.products?.length??0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 0.2,
                      crossAxisCount: 2),
                  itemBuilder: (context,index){
                    return ProductTileAPI(
                      image: provider.allProducts.products?[index].images![0],
                      title: provider.allProducts.products?[index].title,
                      category: provider.allProducts.products?[index].category,
                      price: provider.allProducts.products?[index].price,
                      description: provider.allProducts.products?[index].description,
                      discountPercentage: provider.allProducts.products?[index].discountPercentage,
                      rating: provider.allProducts.products?[index].rating,
                      stock: provider.allProducts.products?[index].stock,
                      returnPolicy: provider.allProducts.products?[index].returnPolicy,
                      shippingInformation: provider.allProducts.products?[index].shippingInformation,
                      warrantyInformation: provider.allProducts.products?[index].warrantyInformation,
                      p: provider.allProducts.products?[index],
                      count: provider.allProducts.products?[index].count,
                    );
                  }),
            );
          }
      ),
    );
  }
}
