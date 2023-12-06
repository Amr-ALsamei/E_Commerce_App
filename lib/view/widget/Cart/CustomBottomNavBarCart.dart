// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:e_commerceapp/controller/cart_controller.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/view/widget/Cart/CartButton.dart';
import 'package:e_commerceapp/view/widget/Cart/customBottonCoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigitionBarCart extends StatelessWidget {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController couponcontroller;
  final void Function()? onApplyCoupon;
  const CustomBottomNavigitionBarCart(
    {super.key,
     required this.price,
      required this.discount,
      required this.shipping,
       required this.totalprice,
        required this.couponcontroller, 
        this.onApplyCoupon});

  @override
  Widget build(BuildContext context) {
   CartController controller=  Get.put(CartController());
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
            builder: (controller)=>controller.couponname==null?
            Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller:couponcontroller ,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 6),
                    hintText: "Coupon Code",
                    border: OutlineInputBorder()
                  ),
                )),

                SizedBox(width: 5,),
              Expanded(
                flex: 1,
                child: CustomButtonCoupon(title: "Apply",
                onPressed:onApplyCoupon ,
              ))

            ],),
          ):Container(
            child: Text("Coupon  ${controller.couponname!}",
            style: TextStyle(color: Appcolors.primarycolor,fontSize: 15,fontWeight: FontWeight.bold),),
          )
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Appcolors.primarycolor,width: 1),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            // ignore: prefer_const_constructors
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Price",style: TextStyle(fontSize: 16),),
              Text(price,style: TextStyle(fontSize: 16),)
            ],),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            // ignore: prefer_const_constructors
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Discount",style: TextStyle(fontSize: 16),),
              Text(discount,style: TextStyle(fontSize: 16),)
            ],),
          ),
            Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            // ignore: prefer_const_constructors
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("shipping",style: TextStyle(fontSize: 16),),
              Text(shipping,style: TextStyle(fontSize: 16),)
            ],),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            // ignore: prefer_const_constructors
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("TotalPrice",style: TextStyle(fontSize: 16),),
              Text(totalprice,style: TextStyle(fontSize: 16),)
            ],),
          ),
         
          
          
              ],
            ),
          ),
          CustomCartButton(onPressed: () {
            controller.goToCheckOut();
            //  Get.toNamed(RoutesApp.checkout);
          },),
        ],
      ),
      );
  }
}