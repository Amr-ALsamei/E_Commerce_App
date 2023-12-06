import 'dart:async';
import 'package:e_commerceapp/Data/Datasource/remote/orders/details_data.dart';
import 'package:e_commerceapp/Data/Model/CartModel.dart';
import 'package:e_commerceapp/Data/Model/ordersModel.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController{

  late OrdersModel ordersModel;

 Completer<GoogleMapController>? completercontroller; 
  //  Position? position; 
    CameraPosition? kGooglePlex ;//Camera Position

    List <Marker> markers=[];
   
  OrderDetailsData orderDetailsData=OrderDetailsData(Get.find());//Get.find() Takes from initialBinding
  List<CartModel> data=[];
  StatusRequest statusRequest=StatusRequest.None;

initialDataPosition(){
  if(ordersModel.orderType==0){
    kGooglePlex= CameraPosition(
    target: LatLng(double.parse(ordersModel.addressLat.toString()), 
                   double.parse(ordersModel.addressLong.toString()),),
    zoom: 12.4746,
  );
  markers.add(Marker(markerId: MarkerId("1"),
                              position:LatLng(double.parse(ordersModel.addressLat.toString()), 
                              double.parse(ordersModel.addressLong.toString()),),
                               )
                              );
  }
 }
////////////////////////////
  @override
  void onInit() {
    ordersModel=Get.arguments["ordermodel"];
    initialDataPosition();
    getDetailsData();
    super.onInit();
  }
///////////////////////////////////
getDetailsData()async{
    statusRequest=StatusRequest.loading;
    var response=await orderDetailsData.getData(ordersModel.orderID!);
    statusRequest=handlingData(response);

    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
       List listData=response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
        print(listData);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
/////////////////////////////////
}