import 'package:e_commerceapp/Data/Datasource/remote/Address_data.dart';
import 'package:e_commerceapp/Data/Datasource/remote/checkout_data.dart';
import 'package:e_commerceapp/Data/Model/AddressModel.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController{
 
 AddressData addressData=Get.put(AddressData(Get.find()));
 CheckOutData checkOutData=CheckOutData(Get.find());
 MyServices myServices=Get.find();
 StatusRequest statusRequest=StatusRequest.None;

 List<AddressModel> dataAddress=[];

 String? paymentMethod;
 String? DeliveryType;
 int? addressid;
 late int couponid;
 late String priceorder;
 int? coupondiscount;

 ChoosePaymetMethod(String val){
  paymentMethod=val;
  update();

 }

 ChooseDeliveryType(String val){
  DeliveryType=val;
  update();

 }

 ChooseShippingAddress(int val){
  addressid=val;
  update();

 }

getShippingAddress()async{

  statusRequest=StatusRequest.loading;
    var response=await addressData.getAddress(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);

    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List listData=response['data'];
        dataAddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
        addressid=dataAddress[0].addressID!;
        }else{
          // statusRequest=StatusRequest.failure;
          statusRequest=StatusRequest.success;
        }
    }
    update();
 }

checkOutdata()async{
  if(paymentMethod==null){
    return Get.snackbar("Alert", "Please choose Your Payment Method");
  }
   if(DeliveryType==null) {
    return Get.snackbar("Alert", "Please choose Your Delivert Type");
}
 if(dataAddress.isEmpty) {
    return Get.snackbar("Alert", "Please choose Your Shipping address");
}
// if(addressid==null) {
//     return Get.snackbar("Alert", "Please choose Your Shipping address");
// }
  statusRequest=StatusRequest.loading;
  update();
   Map data={
    "userId":myServices.sharedPref.getString("Id"),
    "addressId":addressid.toString(),
    "ordertype":DeliveryType.toString(),
    "pricedelivery":"10",
    "price":priceorder.toString(),
    "coupon":couponid.toString(),
    "coupondiscount":coupondiscount.toString(),
    "paymentmethod":paymentMethod.toString(),

  };
    var response=await checkOutData.postCheckOuData(data);
    statusRequest=handlingData(response);

    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         Get.offAllNamed(RoutesApp.homepage);
        }else{
          
          statusRequest=StatusRequest.None;
          Get.snackbar("Alert", "Please try again");
        }
    }
    update();
 }

 @override
  void onInit() {
    
   couponid= Get.arguments["couponId"];
   priceorder=Get.arguments["priceOrder"];
   coupondiscount=Get.arguments["discountcoupon"];
    getShippingAddress();
    super.onInit();
  }
 


}