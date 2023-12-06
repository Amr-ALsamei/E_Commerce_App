import 'package:e_commerceapp/controller/orders/archive_controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/view/widget/orders/orderslistArchiveCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ArchiveOrderScreen extends StatelessWidget {
  const ArchiveOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersController());
    return Scaffold(
      appBar: AppBar(title: Text("Archive Order"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<ArchiveOrdersController>(
          builder: (controller) {
            return HandlingDataView(statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CardOrdersArchive(listdata: controller.data[index],),
            
              
                  ),
            );
          }
        ),),
    );
  }
}