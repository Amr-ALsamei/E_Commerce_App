import 'package:e_commerceapp/Data/Datasource/remote/favorite_data.dart';
import 'package:e_commerceapp/Data/Model/FavoriteItems.dart';
import 'package:e_commerceapp/controller/home_controller.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends SearchMixinController{

  FavoriteData favoriteData=FavoriteData(Get.find());
 StatusRequest statusRequest=StatusRequest.None;
 List data=[];
 MyServices myServices=Get.find();
 List<FavoriteItemsModel> favoriteitemsdata=[];
 

  Map isFavorite={};

  // key => id items
  // Value => 1 OR 0

 

  setFavorite(id,val){
    isFavorite[id]=val;
    update();
  }
  

  addFavorite(String itemid)async{
    data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await favoriteData.AddFavorite(myServices.sharedPref.getString("Id")!,itemid);
    statusRequest=handlingData(response);

    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.rawSnackbar(title: "Alert",messageText: Text("You are Add item to favorite"));
        // data.addAll(response['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();

  }

  removeFavorite(String itemid)async{
     data.clear();
    
    statusRequest=StatusRequest.loading;
    update();
    var response=await favoriteData.RemoveFavorite(myServices.sharedPref.getString("Id")!,itemid);
    statusRequest=handlingData(response);

    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      
      Get.rawSnackbar(title: "Alert",messageText: Text("You are remove item from favorite"));
        // data.addAll(response['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
   
    update();

  }

  ViewFavoriteData()async{
    favoriteitemsdata.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await favoriteData.ViewFavoriteItems(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
     print("object");
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsedata=response['data'];
        favoriteitemsdata.addAll(responsedata.map((e) => FavoriteItemsModel.fromJson(e)));
        
        
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();

  }

  DeleteFavoriteData(String favoriteid){
    //  favoriteitemsdata.clear();
    // statusRequest=StatusRequest.loading;
    favoriteData.DeleteFavoriteItem(favoriteid);
    favoriteitemsdata.removeWhere((element) => element.favoriteID==favoriteid ,);
    update();
    ViewFavoriteData();
  }

  ////////////////
  @override
  void onInit() {
    searhitem=TextEditingController();
    ViewFavoriteData();
    super.onInit();
  }
  //////////////////////
 
}