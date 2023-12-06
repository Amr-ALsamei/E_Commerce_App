
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerceapp/Data/Model/itemsmodel.dart';
import 'package:e_commerceapp/controller/Items_controller.dart';
import 'package:e_commerceapp/controller/favorite_controller.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/constant/imageAssest.dart';
import 'package:e_commerceapp/linkAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  // final String ItemTitle;
  final ItemModel itemModel;
  
  final bool active;
  const CustomListItems(
   {super.key,required this.active,
   required this.itemModel});
 
  @override
  Widget build(BuildContext context) {
   
    return   InkWell(
          onTap: () {
            controller.goToProductDetails(itemModel);
          },
          child: Card(
                    child: Stack(
                      children: [
                        Padding(padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Hero(tag: "${itemModel.itemID}",
                              child: CachedNetworkImage(
                                height: 100,
                                imageUrl: "${AppLinks.imageitem}/${itemModel.itemImage}")
                              ),
                            Text("${itemModel.itemName}",textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15,color: Colors.black)),
                            // Text("${itemModel.itemDesc}",),
                            
                           
                      //  Divider(color: Colors.black,),
                            GetBuilder<ItemsControllerImp>(
                              builder: (controller) {
                                return Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                       
                                      Text("Rating ${controller.isRating[itemModel.itemID]}",textAlign: TextAlign.start,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          RatingBar.builder(
                                           initialRating:controller.isRating[itemModel.itemID].toDouble() ,
                                            minRating: 0,
                                            itemCount: 5,
                                            itemSize: 30,
                                            direction: Axis.horizontal,
                                            allowHalfRating: false,
                                            itemBuilder: (context,_){
                                              return Icon(Icons.star,color: Appcolors.primarycolor,);

                                            },
                                        onRatingUpdate: (rating){

                                           controller.UpdateRatingVal(rating,
                                           itemModel.itemID.toString(),
                                           );
                                          
                                           })
                                          // ...List.generate(5,
                                          //  (index) => Icon(Icons.star,size: 12,))
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${itemModel.itemsPriceDiscount}\$",
                                  style: TextStyle(fontSize: 15,color:Appcolors.primarycolor)),
                                  GetBuilder<FavoriteController>(
                                    builder: (controller) {
                                      return IconButton(onPressed: (){
                                        if(controller.isFavorite[itemModel.itemID]==1){
                                           controller.setFavorite(itemModel.itemID, 0);
                                           controller.removeFavorite(itemModel.itemID.toString());
                                        }else{
                                          controller.setFavorite(itemModel.itemID, 1);
                                          controller.addFavorite(itemModel.itemID.toString());
                                        }
                                      }, icon: Icon(
                                      controller.isFavorite[itemModel.itemID]==1? Icons.favorite
                                              :Icons.favorite_border_outlined,color: Appcolors.primarycolor,));
                                    }
                                  )
                                ],
                              ),
                            
                          ],
                        ),
                        ),
                       if(itemModel.itemDiscount!=0)
                        Image.asset(AppImageAssets.saleone,width: 40,)
                        
                      ],
                    ),
                   ),);
                 
  }
}