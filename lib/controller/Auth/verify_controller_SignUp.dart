import 'package:e_commerceapp/Data/Datasource/remote/Auth/verfiycodeSignupData.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:get/get.dart';

abstract class VerificationControllerSignUp extends GetxController{
  CheckCode();
  goToSuccessSignUp(String verficationcode);
}

class VerificationControllerSignUpImp extends VerificationControllerSignUp{

  VeryfyCodeSignupData veryfyCodeSignupData=VeryfyCodeSignupData(Get.find());

  
  String? email;
 StatusRequest statusRequest=StatusRequest.None;
  @override
  CheckCode() {
    
  }
  
  @override
  goToSuccessSignUp(String verficationcode)async {
    statusRequest=StatusRequest.loading;
      update();
    var response=await veryfyCodeSignupData.VerfyCodeSignupPostData(email!,verficationcode);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        // data.addAll(response['data']);
        Get.toNamed(RoutesApp.SuccessedSignUp);
      // Get.delete<SignUpControllerImp>();
        }else{
          Get.defaultDialog(title: "Wraning",
          middleText: "VeryFiyCode number Not Correct");
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    
  }

  
@override
  void onInit() {
    // TODO: implement onInit
    email=Get.arguments['email'];
    super.onInit();
  }
  Resend(){
    veryfyCodeSignupData.ResendVerfyCodeSignup(email!);
  }

}