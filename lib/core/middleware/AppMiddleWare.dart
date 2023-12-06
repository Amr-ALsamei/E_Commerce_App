// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMiddleWare extends GetMiddleware{

  @override
  int? get priority =>1;
  MyServices myServices=Get.find();

 @override
  RouteSettings? redirect(String? route){
    if(myServices.sharedPref.getString("step")=="2"){
      return const RouteSettings(name: RoutesApp.homepage);
    }
    if(myServices.sharedPref.getString("step")=="1"){
      return const RouteSettings(name: RoutesApp.login);
    }
    
    return null;

  }
}