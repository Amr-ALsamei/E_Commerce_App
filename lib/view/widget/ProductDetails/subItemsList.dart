import 'package:e_commerceapp/controller/productDetailsController.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
                   ...List.generate(controller.subitems.length,
                    (index) => Container(
                      margin: EdgeInsets.only(left: 10),
                      alignment:Alignment.center,
                      width: 90,
                      height: 60,
                     decoration: BoxDecoration(border: Border.all(color: Colors.black,),
                     borderRadius: BorderRadius.circular(10),
                     color:controller.subitems[index]["active"]=="1"? Appcolors.fourthcolor:Colors.white),
                     child: Text(controller.subitems[index]["name"],style: TextStyle(fontWeight: FontWeight.bold,
                     color:controller.subitems[index]["active"]=="1"? Colors.white:Colors.black),), 
                    ),)
                     ]);
  }
}