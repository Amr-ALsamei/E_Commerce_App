
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerceapp/Data/Model/itemsmodel.dart';
import 'package:e_commerceapp/controller/favorite_controller.dart';
import 'package:e_commerceapp/controller/offers_controller.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/constant/imageAssest.dart';
import 'package:e_commerceapp/linkAPI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsOffers extends GetView<OffersController> {
  // final String ItemTitle;
  final ItemModel itemModel;
  final bool active;
  const CustomListItemsOffers( {super.key,required this.active, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return    Card(
              
                    child: Stack(
                      children: [
                        Padding(padding: EdgeInsets.all(6),
                        child: Column(
                          children: [
                            CachedNetworkImage( 
                            imageUrl: "${AppLinks.imageitem}/${itemModel.itemImage}"),
                            Text("${itemModel.itemName}",textAlign: TextAlign.center,
                                 style: TextStyle(fontSize: 15,color: Colors.black)
                                 ),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Rating 3.5",textAlign: TextAlign.center,),

                                    Row(children: [
                                      ...List.generate(5,
                                       (index) => Icon(Icons.star,size: 14,color: Appcolors.primarycolor,))

                                    ],)
                                  ],
                                 ),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Price: ${itemModel.itemPrice}\$",
                                      style: TextStyle(fontSize: 17,color:Appcolors.primarycolor)
                                      ),
                                    Text("After Discout: ${itemModel.itemsPriceDiscount}\$",
                                      style: TextStyle(fontSize: 17,color:Appcolors.primarycolor)
                                      ),
                                      
                                   GetBuilder<FavoriteController>(builder: (controller){
                                     return IconButton(
                                        onPressed: (){
                                          if(controller.isFavorite[itemModel.itemID]==1){
                                            controller.setFavorite(itemModel.itemID, 0);
                                            controller.removeFavorite(itemModel.itemID.toString());
                                          }else{
                                             controller.setFavorite(itemModel.itemID, 1);
                                             controller.addFavorite(itemModel.itemID.toString());
                                        }
                                        }, 
                                      icon:Icon( controller.isFavorite[itemModel.itemID]==1?Icons.favorite
                                      :Icons.favorite_border_outlined,color: Appcolors.primarycolor,));
                                    
                                   })

                                  ],
                                 )

                             
                          ],
                        ),
                        ),
                        
                       if(itemModel.itemDiscount!=0)
                        Image.asset(AppImageAssets.saleone,width: 40,)
                        
                      ],
                    ),
                   );
                 
  }
}