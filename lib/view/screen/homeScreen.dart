import 'dart:io';

import 'package:e_commerceapp/controller/homeScreen_controller.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/view/widget/custombottomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder:(controller)=> Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          Get.toNamed(RoutesApp.cart);
        },
        backgroundColor: Appcolors.primarycolor,
        child: Icon(Icons.shopping_basket),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //////////////////////////////////////////////
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(  ),
          notchMargin: 10,
          child: Row(
            children: [
              ...List.generate(controller.listPages.length+1 , (index) { 
                int i=index> 2 ?index-1:index;
                return index==2 ? const Spacer()
               :CustomBottomAppBar(onPressed: () {
                    controller.ChangePage(i);
                  },
                  title: controller.Bottomappbar[i]["title"],
                  icon: controller.Bottomappbar[i]["icon"],active:controller.currentpage==i? true:false,);}
                  ),
             
            ],
          ),
        ),
        body:WillPopScope(
          child: controller.listPages.elementAt(controller.currentpage),
          onWillPop: (){
            Get.defaultDialog(
              title: "Alert",
              middleText: "Do you want to Exit",
              onConfirm: (){
                exit(0);
              },
              onCancel: () {
                
              },
              buttonColor: Appcolors.primarycolor
              );
           return Future.value(false);
         })
      ),
    );
  }
}