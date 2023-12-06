import 'package:e_commerceapp/controller/favorite_controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/view/screen/homepage.dart';
import 'package:e_commerceapp/view/widget/Home/customTabbar.dart';
import 'package:e_commerceapp/view/widget/Items/customFavoriteItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ListFavoriteItems extends StatelessWidget {
  const ListFavoriteItems({super.key});

  @override
  Widget build(BuildContext context) {
  FavoriteController controller=  Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child:  ListView(
              children: [
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
               /////////////////////////////////////
               GetBuilder<FavoriteController>(
               builder: (controller) =>
                   HandlingDataView(statusRequest: controller.statusRequest,
                    widget: !controller.isSearch? GridView.builder(
                      shrinkWrap: true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemCount: controller.favoriteitemsdata.length,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7
                      ),
                       itemBuilder: (context,index){
                        return CustomFavoriteItems(favoriteItemsModel: controller.favoriteitemsdata[index]);
                       }):CustomItemSearch(lisiItemModel: controller.itemsModel)
                       ) ),
              ],
            ),
          
       
      ),
    );
  }
}