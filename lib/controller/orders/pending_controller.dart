import 'package:e_commerceapp/Data/Datasource/remote/orders/pendingorder_data.dart';
import 'package:e_commerceapp/Data/Model/ordersModel.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:get/get.dart';

class PendingOrdersController extends GetxController{

 List<OrdersModel> data=[];
 StatusRequest statusRequest=StatusRequest.None;
 PendingOrderData pendingOrderData=PendingOrderData(Get.find());
 MyServices myServices=Get.find();

getPendingOrders()async {
    data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await pendingOrderData.getPendingData(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      List respnseData=response['data'];
      data.addAll(respnseData.map((e) => OrdersModel.fromJson(e)));
      // print(data);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
//////////////////////////////
DeletePendingOrders(String orderid)async {

    statusRequest=StatusRequest.loading;
    update();
    var response=await pendingOrderData.DeletePendingData(orderid);
    statusRequest=handlingData(response);
    
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      refreshOrder();
      
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
//////////////////////////////
refreshOrder(){
  getPendingOrders();
}

goToTrackingPage(OrdersModel ordersModel){
   Get.toNamed(RoutesApp.orderstrackingpage,arguments: {
                          "ordermodel":ordersModel
                        });
}
///////////////////////////////
  @override
  void onInit() {
    getPendingOrders();
    super.onInit();
  }
}