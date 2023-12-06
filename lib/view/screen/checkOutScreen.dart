import 'package:e_commerceapp/controller/CheckOut_Controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/constant/imageAssest.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/view/widget/CheckOut/CardPaymentMethod.dart';
import 'package:e_commerceapp/view/widget/CheckOut/cardDeliveryType.dart';
import 'package:e_commerceapp/view/widget/CheckOut/cardShippingAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller=Get.put(CheckOutController());
    return Scaffold(
      appBar: AppBar(title:const Text("Check Out"),),
      bottomNavigationBar: Container(
           padding: const EdgeInsets.symmetric(horizontal: 30),
        
        child: MaterialButton(
               color: Appcolors.primarycolor,
               onPressed: (){
                controller.checkOutdata();
               },
                child: const Text("Check Out",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
           ),
      body: GetBuilder<CheckOutController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(child: ListView(
              children:  [
              
                Text("Choose Payment Method",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Appcolors.secondcolor),
                ),
             
                InkWell(
                  onTap:(){
                   controller.ChoosePaymetMethod("0");//0=>Cash
                  } ,
                  child: CardPayMentMethodCheckOut(
                    title: "Cash on Delivery", 
                    isActive:controller.paymentMethod=="0"? true:false)
                  ),
              
                 InkWell(
                  onTap: () {
                    controller.ChoosePaymetMethod("1");//1=>Card
                  },
                  child: CardPayMentMethodCheckOut(
                    title: "Payment Cards",
                    isActive:controller.paymentMethod=="1"? true:false)
                  ),
                  SizedBox(height: 10,),
          
                  Text("Choose Delivery Type",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Appcolors.secondcolor),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.ChooseDeliveryType("0");//0=>Delivery
                      },
                      child: CardDeliveryTypCheckOut(
                        title: "Delivery",
                         imageName: AppImageAssets.deliveryimage,
                          isActive:controller.DeliveryType=="0"?true: false),
                    ),
          
                     InkWell(
                      onTap: () {
                        controller.ChooseDeliveryType("1");//1=>recieve
                      },
                       child: CardDeliveryTypCheckOut(
                           title: "Receive",
                           imageName: AppImageAssets.deliveryTrue,
                           isActive:controller.DeliveryType=="1"?true: false),
                     ),
                    
                  ],
                ),
          
             SizedBox(height: 15,),
          if(controller.DeliveryType=="0") 
              // ignore: prefer_const_constructors
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   if(controller.dataAddress.isNotEmpty)
                   Text("Shipping Address",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Appcolors.secondcolor),
                ),
               SizedBox(height: 10,),
                // ignore: prefer_const_constructors
                if(controller.dataAddress.isEmpty)
                 InkWell(
                  onTap: () {
                    Get.toNamed(RoutesApp.addressadd);
                  },
                   child: Center(
                     child: Text("Please Add shipping address \n click here",textAlign: TextAlign.center
                     ,style: TextStyle(fontSize: 15,color: Appcolors.primarycolor),
                     ),
                   ),
                 ),
                ...List.generate(controller.dataAddress.length,
                  (index) => InkWell(
                    onTap: () {
                      controller.ChooseShippingAddress(controller.dataAddress[index].addressID!);
                    },
                    child: CardShippingAddressCheckOut(
                    title: "${controller.dataAddress[index].addressName}",
                     body: "${controller.dataAddress[index].addressCity}/${controller.dataAddress[index].addressStreet}",
                      isActive:controller.addressid==controller.dataAddress[index].addressID?true: false),
                  ),
                )
                
                ],
               )
                
              ],
            ),),
          );
        }
      ),
    );
  }
}