
import 'package:e_commerceapp/controller/favorite_controller.dart';
import 'package:e_commerceapp/controller/offers_controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/view/screen/homepage.dart';
import 'package:e_commerceapp/view/widget/Home/customTabbar.dart';
import 'package:e_commerceapp/view/widget/offers/customofferlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersViewScreen extends StatelessWidget {
  const OffersViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());

    return GetBuilder<OffersController>(
      builder: (controller) =>Container(
        padding: EdgeInsets.all(15),
        child: ListView(
           
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

              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 itemCount: controller.data.length,
                 itemBuilder: (context,index)=>CustomListItemsOffers(
                 active: false, itemModel: controller.data[index])
                 ):CustomItemSearch(lisiItemModel: controller.itemsModel)
                 )
                 
          ],
        ),
      )
         
      
    );
  }
}



