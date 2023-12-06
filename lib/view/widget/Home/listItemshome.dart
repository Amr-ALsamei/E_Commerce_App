import 'package:e_commerceapp/Data/Model/itemsmodel.dart';
import 'package:e_commerceapp/controller/home_controller.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/function/TranslationdataBase.dart';
import 'package:e_commerceapp/linkAPI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 250,
             child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.items.length,
              itemBuilder: (context,i){
                  return ItemsHome(itemModel:ItemModel.fromJson (controller.items[i]));
              }),
             );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
 final ItemModel itemModel;
  const ItemsHome({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemModel);
      },
      child: Stack(
                          children: [
                            Container(
                              padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              margin:const EdgeInsets.symmetric(horizontal: 15),
                              child: Image.network(
                                "${AppLinks.imageitem}/${itemModel.itemImage}",
                                 width: 150,
                                 height: 150,
                                 fit: BoxFit.fill,),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color:Appcolors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20)
                               ),
                               height:170 ,
                               width:180 ,
                            ),
                            Positioned(
                              left: 10,
                              top: 10,
                              child: Text(translateDataBase("${itemModel.itemNameAr}", "${itemModel.itemName}"),
                              style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                              color: Colors.white),))
                          ],
                    ),
    );
  }
}