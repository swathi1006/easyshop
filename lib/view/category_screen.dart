import 'package:easyshop/utils/mycolors.dart';
import 'package:easyshop/view/widgets/productTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/categoryController.dart';

class CategoryScreen extends StatelessWidget {

  void fetchData(BuildContext context) async {
    Provider.of<CategoryController>(context,listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryController>(
        builder: (context, provider, child){
          return DefaultTabController(
              length: provider.categoryList.length,
              initialIndex: 0,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 10,
                  automaticallyImplyLeading: false,
                  backgroundColor: MyColors.basicColor,
                  bottom: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white38,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 0.15),
                   // overlayColor: WidgetStatePropertyAll(Colors.white),
                    indicator: BoxDecoration(
                       // color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    isScrollable: true,
                    tabs: List.generate(
                        provider.categoryList.length,
                            (index) => Tab(
                            text:provider.categoryList[index]
                        )),
                    onTap: (value){
                      provider.onTap(index: value);
                    },
                  ),
                ),

                body: provider.isLoading == true ? Center(
                  child: Text("Loading"),)
                    :Padding(padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      itemCount: provider.allProducts.products?.length ?? 0,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 0.2,
                          crossAxisCount: 2),
                      itemBuilder: (context,index){
                        return ProductTileAPI(
                          image: provider.allProducts.products?[index].images![0],
                          title: provider.allProducts.products?[index].title,
                          category: provider.allProducts.products?[index].category,
                          price: provider.allProducts.products?[index].price,
                          description: provider.allProducts.products?[index].description,
                        );
                      }),
                ),
              ));
        });
  }
}
