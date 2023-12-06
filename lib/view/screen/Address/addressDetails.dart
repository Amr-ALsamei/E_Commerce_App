import 'package:e_commerceapp/controller/Address/Adddetails_Controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/function/validator.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(AddressDetailsController());
    return Scaffold(
      appBar: AppBar(title: Text("Add Address Details"),),
     
      body: GetBuilder<AddressDetailsController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(15),
              child: ListView(
                children: [
                  Form(
                    key: controller.formstate,
                    child: Column(
                    children: [
                      CustumFormField(
                    label: "City", 
                    hinttext: "City", icon: Icons.location_city,
                     mycontroller: controller.city!, 
                     valid: (val){
                      return ValidInput(val!, 2, 100, "username");
                     }, 
                     isNumber: false
                     ),
                     CustumFormField(
                    label: "Street", 
                    hinttext: "Street", icon: Icons.streetview,
                     mycontroller: controller.street!, 
                     valid: (val){
                     return ValidInput(val!, 2, 100, "username");
                     }, 
                     isNumber: false
                     ),
                     CustumFormField(
                    label: "Name", 
                    hinttext: "Name", icon: Icons.near_me,
                     mycontroller: controller.name!, 
                     valid: (val){
                     return ValidInput(val!, 2, 100, "username");
                     }, 
                     isNumber: false
                     ),
                    ],
                   )),
          
                     CustumButtonAuth(
                      text: "Add Details",
                      onPressed: () {
                       controller.addAddressData();
                     },)
                ],
              ),
            ),
          );
        }
      )
    );
  }
}