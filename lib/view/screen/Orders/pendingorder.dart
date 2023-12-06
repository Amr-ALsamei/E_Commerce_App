
import 'package:e_commerceapp/controller/orders/pending_controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/view/widget/orders/orderslistCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PendingOrderScreen extends StatelessWidget {
  const PendingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
      appBar: AppBar(title: Text("Pending Order")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<PendingOrdersController>(
          builder: (controller) {
            return HandlingDataView(statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CardOrders(listdata: controller.data[index],),
            
              
                  ),
            );
          }
        ),),
    );
  }
}

