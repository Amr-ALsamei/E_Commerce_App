import 'package:e_commerceapp/Data/Datasource/remote/orders/Notification_data.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{

 NotificationData notificationData=NotificationData(Get.find());//Get.find() Takes from initialBinding
 MyServices myServices=Get.find();
  List data=[];

   StatusRequest statusRequest=StatusRequest.None;

  getnotifications()async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await notificationData.getNotificationData(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        data.addAll(response['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
  @override
  void onInit() {
    getnotifications();
    super.onInit();
  }

}