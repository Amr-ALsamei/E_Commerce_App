import 'dart:async';

import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController{

   Completer<GoogleMapController>? completercontroller; 
   Position? position; 
   StatusRequest statusRequest=StatusRequest.loading;  
      
   CameraPosition? kGooglePlex ;
   List <Marker> markers=[];
   
   double? lat;
   double? long;

addMarkers(LatLng latLng){
      markers.clear();
      markers.add(Marker(markerId: MarkerId("1"),position: latLng));
      lat=latLng.latitude;
      long=latLng.longitude;
      update();
    }

goToAddressDetails(){
  Get.toNamed(RoutesApp.addressadddetails,arguments: {
          'lat':lat,
          'long':long
        });
}

 getCurrentLocation()async{
    position=await Geolocator.getCurrentPosition();
    kGooglePlex= CameraPosition(
    target: LatLng(position!.latitude, position!.longitude),
    zoom: 12.4746,
  );
  addMarkers(LatLng(position!.latitude, position!.longitude));
   statusRequest=StatusRequest.None;
   update();

 }
      @override
  void onInit() {
    getCurrentLocation();
    completercontroller=Completer<GoogleMapController>();
    super.onInit();
  }
}