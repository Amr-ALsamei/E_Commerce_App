import 'package:e_commerceapp/Data/Datasource/Static/static.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChange(int index);

}
class OnBoardingControllerImpllement extends OnBoardingController{
  late PageController pageController;

  int currentPage=0;
  
  MyServices myServices=Get.find();

  @override
  next() {
    currentPage++;
    if(currentPage> onboardinglist.length-1) {
       myServices.sharedPref.setString("step","1");
       Get.offAllNamed(RoutesApp.login);
    }else{
      pageController.animateToPage(currentPage, duration: Duration(microseconds: 700), 
    curve: Curves.easeInOut);
    }
  }

  @override
  onPageChange(int index) {
    currentPage=index;
    update();
  }

  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }

}