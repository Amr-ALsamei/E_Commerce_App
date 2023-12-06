
import 'package:e_commerceapp/Data/Datasource/remote/offers_data.dart';
import 'package:e_commerceapp/Data/Model/itemsmodel.dart';
import 'package:e_commerceapp/controller/home_controller.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixinController{

  OffersData offersData=OffersData(Get.find());//Get.find() Takes from initialBinding

  List<ItemModel> data=[];

  StatusRequest statusRequest=StatusRequest.None;

getOffers()async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await offersData.getOffersData();
    statusRequest=handlingData(response);

    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
       List responseData=response['data'];
        data.addAll(responseData.map((e) => ItemModel.fromJson(e)));
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
  
  @override
  void onInit() {
    searhitem=TextEditingController();
    getOffers();
    super.onInit();
  }
}