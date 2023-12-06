import 'package:e_commerceapp/view/screen/NotificationScreen.dart';
import 'package:e_commerceapp/view/screen/SettingsScreen.dart';
import 'package:e_commerceapp/view/screen/homepage.dart';
import 'package:e_commerceapp/view/screen/offersScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController{

  ChangePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController{
 int currentpage=0;
 List<Widget> listPages=[
  const  HomePage(),
  
  OffersViewScreen(),

 SettingsScreen(),

  NotificationScreen(),

 ];

 List Bottomappbar=[
 { "title":"Home","icon":Icons.home},
 { "title":"Offers","icon":Icons.local_offer},
 {"title": "Settings","icon":Icons.settings},
  {"title":"notification","icon":Icons.notifications},
 ];

  @override
  ChangePage(int i) {
    currentpage=i;
    update();
  }

}