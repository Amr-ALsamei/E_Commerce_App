
import 'package:e_commerceapp/controller/cart_controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/view/widget/Cart/CustomBottomNavBarCart.dart';
import 'package:e_commerceapp/view/widget/Cart/CustomItemsCard.dart';
import 'package:e_commerceapp/view/widget/Cart/TopCartCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
     CartController cartController=Get.put(CartController());
    //  print(cartController.totalcountitems);
    //  print();
/////////////////////////////////////////////////////////////
//      return WillPopScope(
//       onWillPop: () {
//         Get.off(() => const PreviousPage());

//         return Future.value(true);
//       },
//     child: YourChildWidget(),
/////////////////////////////////////////////////
    return  Scaffold(
        appBar: AppBar(title: Text("Cart"),
        // automaticallyImplyLeading: false,
        ),
        // ignore: prefer_const_constructors
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) {
            return  CustomBottomNavigitionBarCart(
                price: "${cartController.priceorder}\$",
                 discount: "${controller.coupondiscount}%",
                 shipping: "200\$", totalprice: "${controller.getTotalPrice()}\$",
                onApplyCoupon: () {
                  controller.CheckCoupon();
                 },couponcontroller:controller.couponcontroler! ,);
            
          }
        ),
        body: GetBuilder<CartController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                
                children: [
                  /////////////////////////////
                  // AppBarCart(title: "Cart"),
                ////////////////////////////////
                  // Spacer(),
                  SizedBox(height: 10,),
                 ////////////////////////
                 TopCartCard(number: cartController.totalcountitems.toString()),
                 ///////////////////////
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    // ignore: prefer_const_constructors
                    child: Column(
                      children:  [
                        ...List.generate(controller.data.length,
                         (index) =>  CustomItemsCard(
                          itemname: "${cartController.data[index].itemName}", 
                         itemprice: "${cartController.data[index].itemsprice}\$",
                          itemcount: "${cartController.data[index].countitems}",
                          imagename: "${cartController.data[index].itemImage}",
                          onAdd: ()async {
                           await  cartController.AddCart(cartController.data[index].itemID.toString());
                            cartController.refreshpage();
                           },
                          onRemove: ()async { 
                           await cartController.DeleteCart(cartController.data[index].itemID.toString());
                            cartController.refreshpage();
                          },),
                         )
                         ],
                    ),
                  )
            
              ],),
            );
          }
        ),
    );
  }
}