import 'package:e_commerceapp/controller/SettingsController.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/constant/imageAssest.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller=Get.put(SettingsController());
    return Container(child: ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(height:Get.width/2 ,color: Appcolors.primarycolor,),
            Positioned(
              top: Get.width/2.8,
              child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[100], 
                backgroundImage: AssetImage(AppImageAssets.avatar),
                
               
              ),
            ))

          ],
        ),
        SizedBox(height: 70,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(child: Column(
            
            children: [
               ListTile(
                onTap: () { },
                title: Text("Disibale Notifications"),
                trailing: Switch(value: true, onChanged: (value) {
                  
                })),
                Divider(),
               ListTile(
                onTap: () {
                  Get.toNamed(RoutesApp.pendingorderpage);
                 },
                title: Text("Order"),
                trailing: Icon(Icons.shop_outlined),),
                Divider(),
               ListTile(
                onTap: () {
                  Get.toNamed(RoutesApp.archiveorderpage);
                 },
                title: Text("Archive"),
                trailing: Icon(Icons.archive_outlined),),
              Divider(),
               ListTile(
                onTap: () {
                  Get.toNamed(RoutesApp.addressview);
                 },
                title: Text("Address"),
                trailing: Icon(Icons.location_on_outlined),),
              Divider(),
              ListTile(
                onTap: () { },
                title: Text("About Us"),
                trailing: Icon(Icons.help_outline_rounded),),
              Divider(),
               ListTile(
                onTap: ()async { 
                 await launchUrl(Uri.parse("tel:+967771371692"));
                },
                title: Text("Contact Us"),
                trailing: Icon(Icons.phone_callback_outlined),),

               Divider(),
                ListTile(
                  onTap: () {
                    controller.LogOut();
                   },
                  title: Text("LogOut"),
                     trailing: Icon(Icons.exit_to_app),),
               
            ],
          ),),
        ),
        
      ],
    ),);
  }
}