
import 'package:e_commerceapp/Data/Datasource/remote/Address_data.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetailsController extends GetxController{

   double? lat;
   double? long;

   TextEditingController? name;
   TextEditingController? city;
   TextEditingController? street;

   StatusRequest statusRequest=StatusRequest.None;
   AddressData addressData=AddressData(Get.find());
   MyServices myServices=Get.find();

   GlobalKey<FormState> formstate=GlobalKey<FormState>();


   initialData(){
    name=TextEditingController();
    city=TextEditingController();
    street=TextEditingController();
    lat=Get.arguments['lat'];
    long=Get.arguments['long'];
    print(lat);
    print(long);
   }

addAddressData()async{
    if(formstate.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
    var response=await addressData.addAddress(
      name!.text,
      myServices.sharedPref.getString("Id")!,
      city!.text,
      street!.text,
      lat!,long!

    );
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         Get.offAllNamed(RoutesApp.homepage);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    
    update();
    }
   }


      @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    name?.dispose();
    city?.dispose();
    street?.dispose();
    super.dispose();
  }

}