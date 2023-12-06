import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerceapp/controller/productDetailsController.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/linkAPI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductDetailsPage extends GetView<ProductDetailsControllerImp> {
  const TopProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
          clipBehavior: Clip.none,
          children: [
          
           Container(height: 150,decoration: BoxDecoration(
            color: Appcolors.secondcolor,borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
           
           ),),
            Positioned(
              top: 50,
              right: Get.width/7,
              left: Get.width/7,
              child: Hero(tag: "${controller.itemModel.itemID}",
                          child: CachedNetworkImage(imageUrl:"${AppLinks.imageitem}/${controller.itemModel.itemImage!}" 
                ,height: 150,fit: BoxFit.fill,),
              ))
        ],);
  }
}