import 'package:e_commerceapp/Data/Datasource/remote/Cart_data.dart';
import 'package:e_commerceapp/Data/Model/itemsmodel.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController{
 initialData();

}

class ProductDetailsControllerImp extends ProductDetailsController{
late ItemModel itemModel;
MyServices myServices=Get.find();
CartData cartData=CartData(Get.find());

StatusRequest statusRequest=StatusRequest.None;

int countitemscart=0;

List subitems=[
  {"name":"Red","id":1,"active":"1"},
  {"name":"Black","id":2,"active":"0"},
  {"name":"Blue","id":3,"active":"0"}
];

  @override
  void onInit() {
    initialData();
   
    super.onInit();
  }


  @override
  initialData()async {
   itemModel=Get.arguments['itemsmodel'];
   statusRequest=StatusRequest.loading;
   countitemscart = await GetCountCart(itemModel.itemID.toString());
   
    statusRequest=StatusRequest.success;
    update();
  }

  add(){
    AddCart(itemModel.itemID.toString());
    countitemscart++;
    update();
  }
  
  remove(){
   DeleteCart(itemModel.itemID.toString());
    if(countitemscart>0){
      countitemscart--;
      update();
    }
  }
  ///////////////////////////////////
AddCart(String itemid)async{
  
    statusRequest=StatusRequest.loading;
    update();
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
    update();
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

GetCountCart(String itemid)async{
    int countcart=0;
    statusRequest=StatusRequest.loading;
    // update();
    var response=await cartData.getCountCart(myServices.sharedPref.getString("Id")!,itemid);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      // Get.rawSnackbar(title: "Alert",messageText: Text("You are Delete item From Cart"));
      countcart=response['data'];
      return countcart;
      
        // data.addAll(response['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();

  }
  /////////////////////////////////


}