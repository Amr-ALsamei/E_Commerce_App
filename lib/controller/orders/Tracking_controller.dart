import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerceapp/Data/Model/ordersModel.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/function/getDecodePolyline.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController{
 
  late OrdersModel ordersModel;
MyServices myServices=Get.find();
 GoogleMapController? gmc; 
 StatusRequest statusRequest=StatusRequest.success;
 
  //  Position? position; 
    CameraPosition? kGooglePlex ;//Camera Position

    List <Marker> markers=[];

 
  
  double? destlat;
  double? destlong;
  double? currentlat;
  double? currenlong;

 Set<Polyline> polylineset={};


initialLocation(){
  //////////////////
  
    kGooglePlex= CameraPosition(
    target: LatLng(double.parse(ordersModel.addressLat.toString()), 
                   double.parse(ordersModel.addressLong.toString()),),
    zoom: 12.4746,
  );
  
   markers.add(Marker(markerId: MarkerId("dest"),
                              position:LatLng(double.parse(ordersModel.addressLat.toString()), 
                              double.parse(ordersModel.addressLong.toString()),),
                               )
                              );
  /////////////////
   
}

getLocationDelivery(){
  FirebaseFirestore.instance.collection("delivery").doc(
    ordersModel.orderID.toString()).snapshots().listen((event) {
      if(event.exists){
        destlat=event.get("lat");
        destlong=event.get("long");
        updateMarkerDelivery(destlat!, destlong!);
      }
     });
}

updateMarkerDelivery(double newlat,double newlong){
  markers.removeWhere((element) => element.markerId.value=="dest");
  markers.add(Marker(
    markerId: MarkerId("dest"),
                position:LatLng(newlat, 
                newlong),
                      ));
                update();

}

initPolyline()async{
  
  destlat=ordersModel.addressLat;
  destlong=(ordersModel.addressLong);
  await Future.delayed(Duration(seconds: 1));
  polylineset = await getPolyLine(currentlat, currenlong, destlat, destlong);
 update();
}

@override
  void onInit() {
    ordersModel=Get.arguments["ordermodel"];
     initialLocation();
     getLocationDelivery();
    super.onInit();
  }

@override
  void onClose() {
   
    gmc!.dispose();
    
    super.onClose();
  }
// get current position
// Tracking


}