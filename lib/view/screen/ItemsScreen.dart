
import 'package:e_commerceapp/Data/Model/itemsmodel.dart';
import 'package:e_commerceapp/controller/Items_controller.dart';
import 'package:e_commerceapp/controller/favorite_controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/view/screen/homepage.dart';
import 'package:e_commerceapp/view/widget/Home/customTabbar.dart';
import 'package:e_commerceapp/view/widget/Items/customlistItems.dart';
import 'package:e_commerceapp/view/widget/Items/listCategoriesItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller= Get.put( ItemsControllerImp());
    FavoriteController controllerfav=Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(children: [
               CustomTabBar(
                hinttext: "Find Product",
                onPressedIcon: (){},
             
              onFavorite: () {Get.toNamed(RoutesApp.favoriteItems); },
               onPressedSearch: () { 
                controller.onSearchItem();
               },
              onChanged: (val) {
                controller.checkSearch(val);
              },
              mycontroller: controller.searhitem!,
               ) ,
               SizedBox(height: 15,),
                ListCategoriesItems(),
                    
          GetBuilder<ItemsControllerImp>(
            builder: (controller) =>HandlingDataView(
            statusRequest: controller.statusRequest,
             widget: !controller.isSearch?  GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7
                  ),
                itemCount: controller.data.length,
                 itemBuilder: (BuildContext context, index) {
                  controllerfav.isFavorite[controller.data[index]["item_ID"]]=controller.data[index]["favorite"];
                  controller.isRating[controller.data[index]["item_ID"]]=controller.data[index]["ratingvalu"].toDouble();
                 
                  return CustomListItems(
                      
                     active:true,
                    itemModel:ItemModel.fromJson(controller.data[index]) ,);
                 }):CustomItemSearch(lisiItemModel: controller.itemsModel)),
              )

            ],
                     
        ),
      ),
    );
  }
}

