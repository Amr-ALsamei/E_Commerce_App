import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerceapp/Data/Model/itemsmodel.dart';
import 'package:e_commerceapp/controller/home_controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/linkAPI.dart';
import 'package:e_commerceapp/view/widget/Home/custemcardHome.dart';
import 'package:e_commerceapp/view/widget/Home/customTabbar.dart';
import 'package:e_commerceapp/view/widget/Home/customtitlehome.dart';
import 'package:e_commerceapp/view/widget/Home/listCategorieshome.dart';
import 'package:e_commerceapp/view/widget/Home/listItemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(HomeControllerImp());
  //  Get.put(ItemsControllerImp());
    return  GetBuilder<HomeControllerImp>(
        builder:(controller)=> Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child:ListView(
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
            // ignore: prefer_const_constructors
         HandlingDataView(
           statusRequest: controller.statusRequest,
           widget: !controller.isSearch? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(controller.textSetting.isNotEmpty) CustomCardHome(
                  title: "${controller.textSetting[0]['textSetting_title']}",
                   body: "${controller.textSetting[0]['textSetting_body']}"),
                 ///////////////Categories/////////////////
                 CustomTitleHome(title: "Categories"),
                 ListCategoriesHome(),
                 //////////////////////////////////////////

               //////////Items///////////////////// 
                CustomTitleHome(title: "Top Selling"),
                ListItemsHome(),
               /////////////////////////////////
              ],
            ):CustomItemSearch(lisiItemModel: controller.itemsModel))
            
             

              
            ],
          )
          ),
     
      );
    // );
  }
}

class CustomItemSearch extends GetView<HomeControllerImp> {
  final List<ItemModel> lisiItemModel;
  const CustomItemSearch({super.key, required this.lisiItemModel,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap:true ,
      physics: NeverScrollableScrollPhysics(),
      itemCount: lisiItemModel.length,
      itemBuilder: (context, index) {
         return Container(
          margin: EdgeInsets.only(top:20),
           child: Card(
               child: Container(
                padding: EdgeInsets.all(15),
                 child: Row(
                  children: [
                    Expanded(child: InkWell(
                          onTap: () {
                            controller.goToProductDetails(lisiItemModel[index]);
                          },
                         child: CachedNetworkImage(imageUrl: "${AppLinks.imageitem}/${lisiItemModel[index].itemImage}"))),
                    Expanded(child: ListTile(
                       title: Text("${lisiItemModel[index].itemName}"),
                       subtitle: Text("${lisiItemModel[index].categoryName}"),
                    ))
                  ],
                 ),
               ),
           ),
         );
      },
    );
  }
}

