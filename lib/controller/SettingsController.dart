import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{
MyServices myServices=Get.find();

  LogOut(){
   String userid=myServices.sharedPref.getString("Id")!;
   FirebaseMessaging.instance.unsubscribeFromTopic("user");
   FirebaseMessaging.instance.unsubscribeFromTopic("user${userid}");
   myServices.sharedPref.clear();
   Get.offAllNamed(RoutesApp.login);
  }
}