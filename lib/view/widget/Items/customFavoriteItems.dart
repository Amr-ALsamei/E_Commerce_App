
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerceapp/Data/Model/FavoriteItems.dart';
import 'package:e_commerceapp/controller/favorite_controller.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/linkAPI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavoriteItems extends GetView<FavoriteController> {
  // final String ItemTitle;
  final FavoriteItemsModel favoriteItemsModel;

  const CustomFavoriteItems( {super.key, required this.favoriteItemsModel});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
          onTap: () {
            // controller.goToProductDetails(itemModel);
          },
          child: Card(
                    child: Padding(padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Hero(tag: "${favoriteItemsModel.itemID}",
                          child: CachedNetworkImage(imageUrl: "${AppLinks.imageitem}/${favoriteItemsModel.itemImage}")),
                        Text("${favoriteItemsModel.itemName}",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15,color: Colors.black)),
                        // Text("${itemModel.itemDesc}",),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rating 3.5",textAlign: TextAlign.center,),
                              Row(
                                children: [
                                  ...List.generate(5,
                                   (index) => Icon(Icons.star,size: 12,))
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${favoriteItemsModel.itemPrice}\$",
                              style: TextStyle(fontSize: 15,color:Appcolors.primarycolor)),
                              
                                IconButton(
                                        onPressed: (){
                                          controller.DeleteFavoriteData(favoriteItemsModel.favoriteID.toString());
                                        },
                                       icon: Icon(Icons.delete_outline_outlined,color: Appcolors.primarycolor,))
                                 
                                
                            
                              
                            ],
                          ),
                        
                      ],
                    ),
                    ),
                   ),);
                 
  }
}