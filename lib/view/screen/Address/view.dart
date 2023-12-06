import 'package:e_commerceapp/Data/Model/AddressModel.dart';
import 'package:e_commerceapp/controller/Address/view_Controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressViews extends StatelessWidget {
  
  const AddressViews({super.key});

  @override
  Widget build(BuildContext context) {
   
    Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(title: Text("Address"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(RoutesApp.addressadd);
         },
           child: Icon(Icons.add),),

      body: GetBuilder<AddressViewController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return CardAddressData(
                    onDelet: () {
                      controller.deleteAddressData(controller.data[index].addressID.toString());
                     },
                    addressModel: controller.data[index],
                    );
                }
                
              ),
            ),
          
      ),
    ));
  }
}

class CardAddressData extends GetView<AddressViewController> {
  final AddressModel addressModel;
  final  void Function()? onDelet;
  const CardAddressData({super.key,required this.onDelet, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return  Card(child: Container(
                     padding: EdgeInsets.all(15),
                      child: ListTile(title: Text("${addressModel.addressName}"),
                             subtitle:Text("${addressModel.addressCity}  ${addressModel.addressStreet}" ,
                            ),
                            trailing: IconButton(
                              onPressed: onDelet, icon: Icon(Icons.delete)),
                            ),
                    ),
                  );
  }
}