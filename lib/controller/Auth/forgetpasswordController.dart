import 'package:e_commerceapp/Data/Datasource/remote/Forgetpassword/checkEmaildata.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
  CheckEmail();
  goToverefyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{
  
  GlobalKey<FormState> formstateforgetpassword=GlobalKey<FormState>();

 late TextEditingController email;
 StatusRequest statusRequest=StatusRequest.None;
CheckEmailData checkEmailData=CheckEmailData(Get.find());

  @override
  CheckEmail()async {
     if(formstateforgetpassword.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
    var response=await checkEmailData.CheckEmailPostData(email.text);
    print(response);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        // data.addAll(response['data']);
        Get.offNamed(RoutesApp.verfyCode,arguments: {
          'email':email.text,
        });
      // Get.delete<SignUpControllerImp>();
        }else{
          Get.defaultDialog(title: "Wraning",
          middleText: "Your Email not correct");
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
  }
  
  @override
  goToverefyCode() {
    var formdata=formstateforgetpassword.currentState;
    if(formdata!.validate()){
       Get.toNamed(RoutesApp.verfyCode);
    }else{
      print("not Valid");
    }
   
  }

  void onInit() {
    email=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

}