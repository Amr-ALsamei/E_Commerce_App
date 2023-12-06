
import 'package:e_commerceapp/controller/productDetailsController.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/view/widget/ProductDetails/Count&PriceOfItems.dart';
import 'package:e_commerceapp/view/widget/ProductDetails/TopProductDetailsPage.dart';
import 'package:e_commerceapp/view/widget/ProductDetails/subItemsList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        height: 40,child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Appcolors.secondcolor,
        onPressed: () {
        
          Get.toNamed(RoutesApp.cart);
        
      },child: Text("GO To Cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),),
      body:  Container(
            child: ListView(children: [
              /////////////////////////////////
              TopProductDetailsPage(),
              ///////////////////////////////
              SizedBox(height: 50,),

              GetBuilder<ProductDetailsControllerImp>(
                builder:(controller)=> HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${controller.itemModel.itemName}",style:Theme.of(context).textTheme.headlineLarge!.copyWith(color: Appcolors.fourthcolor,)),
                        SizedBox(height: 10,),
                        //////////////////////////////////
                        CountAndPriceOfItems(onAdd: (){
          
                          controller.add();
                        }, onRemove: (){
                          
                          controller.remove();
                        },
                         itemcount:controller.countitemscart.toString(), 
                         itemprice: controller.itemModel.itemsPriceDiscount.toString()),
                         ////////////////////////////////////////
                       const SizedBox(height: 10,),
                        Text("${controller.itemModel.itemDesc}",style:Theme.of(context).textTheme.bodyMedium),
                       const SizedBox(height: 10,),
                       Text("Color",style:Theme.of(context).textTheme.headlineLarge!.copyWith(color: Appcolors.fourthcolor,)),
                     const  SizedBox(height: 10,),
                     /////////////////////////////
                     SubItemsList(),
                     //////////////////////////
                    
                         
                         
                      
                     
                      ],
                    ),
                  ),
                ),
              )
                  
            ]),
              ),
         
      
      
    );
  }
}