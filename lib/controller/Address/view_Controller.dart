import 'package:e_commerceapp/Data/Datasource/remote/Address_data.dart';
import 'package:e_commerceapp/Data/Model/AddressModel.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController{

   AddressData addressData=AddressData(Get.find());
   MyServices myServices=Get.find();
  List<AddressModel> data=[];

   StatusRequest statusRequest=StatusRequest.None;

deleteAddressData(String addressId){
  addressData.deletAddress(addressId);
  data.removeWhere((element) => element.addressID.toString()==addressId);
  getAddressData();
  update();
}

getAddressData()async{
    data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await addressData.getAddress(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List listData=response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
        
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }



  @override
  void onInit() {
    getAddressData();
    super.onInit();
  }
}