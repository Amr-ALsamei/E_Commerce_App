import 'package:e_commerceapp/Data/Datasource/remote/orders/Archive_data.dart';
import 'package:e_commerceapp/Data/Model/ordersModel.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:get/get.dart';

class ArchiveOrdersController extends GetxController{

 List<OrdersModel> data=[];
 StatusRequest statusRequest=StatusRequest.None;
 ArchiveOrderData archiveOrderData=ArchiveOrderData(Get.find());
 MyServices myServices=Get.find();

getArchivegOrders()async {
    data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await archiveOrderData.getArchiveData(myServices.sharedPref.getString("Id")!);
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
refreshOrder(){
  getArchivegOrders();
}
///////////////////////////////
SubmitRating(String orderid,double rating,String comment)async{
  data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await archiveOrderData.RatingOrdersData(orderid,comment,rating.toString());
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      getArchivegOrders();
      // print(data);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();

}
  @override
  void onInit() {
    getArchivegOrders();
    super.onInit();
  }
}