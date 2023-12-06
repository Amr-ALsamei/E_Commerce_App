
import 'package:e_commerceapp/Data/Datasource/remote/Cart_data.dart';
import 'package:e_commerceapp/Data/Model/CartModel.dart';
import 'package:e_commerceapp/Data/Model/CouponModel.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

late StatusRequest statusRequest=StatusRequest.None;
CartData cartData=CartData(Get.find());
MyServices myServices=Get.find();
TextEditingController? couponcontroler;

List<CartModel> data=[];
int priceorder=0;
String totalcountitems='';

CouponModel? couponModel;
int? coupondiscount=0;
String? couponname;
int? couponid;
////////////ToRefreshPage/////////////////////
resetVarCart(){
 totalcountitems='';
 priceorder=0;
}
refreshpage(){
  resetVarCart();
  ViewCart();
  data.clear();
}
///////////////////////////////////////////

  AddCart(String itemid)async{
  
  
    statusRequest=StatusRequest.loading;
    // update();
    var response=await cartData.AddCartData(myServices.sharedPref.getString("Id")!,itemid);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.rawSnackbar(title: "Alert",messageText: Text("You are Add item to Cart"));
        // data.addAll(response['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }

  DeleteCart(String itemid)async{

     statusRequest=StatusRequest.loading;
    // update();
    var response=await cartData.DeleteCartData(myServices.sharedPref.getString("Id")!,itemid);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.rawSnackbar(title: "Alert",messageText: Text("You are Delete item From Cart"));
        // data.addAll(response['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();

  }



  ViewCart()async{

   statusRequest=StatusRequest.loading;
    // update();
    var response=await cartData.ViewCartData(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      if(response["datacart"]['status']=="success"){
        List responsedata=response["datacart"]['data'];
        Map responsedatacountprice=response["countprice"];
        data.clear();
        data.addAll(responsedata.map((e) => CartModel.fromJson(e)));
        priceorder=responsedatacountprice["totalprice"];
        totalcountitems=responsedatacountprice["totalcount"];
      }
      
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();

  }
  
  CheckCoupon()async{
    statusRequest=StatusRequest.loading;
    // update();
    var response=await cartData.checkCouponData(couponcontroler!.text);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      
      Map<String,dynamic> datacoupon=response['data'];
      couponModel=CouponModel.fromJson(datacoupon);
      coupondiscount=int.parse(couponModel!.couponDiscount.toString());
      couponname=couponModel!.couponName;
      couponid=couponModel!.couponId;
        
      
        }else{
          // statusRequest=StatusRequest.failure;
          coupondiscount=0;
          couponname=null;
          couponid=null;
          Get.snackbar("Alert", "coupon not valid");
        }
    }
    update();

  }

  getTotalPrice(){
    return (priceorder - priceorder*coupondiscount!/100);
  }

  goToCheckOut(){
    if(data.isEmpty) return Get.snackbar("Alert", "The Cart is empty");
    Get.toNamed(RoutesApp.checkout,arguments: {
      "couponId":couponid ?? 0 ,
      "priceOrder":priceorder.toString(),
      "discountcoupon":coupondiscount
    });
  }

  @override
  void onInit() {
    couponcontroler=TextEditingController();
    ViewCart();
    print("The previousRoute is ${Get.previousRoute}");
    super.onInit();
  }

  // @override
  // void dispose() {
  //   Get.toNamed(Get.previousRoute);
  //   super.dispose();
  // }

 
}