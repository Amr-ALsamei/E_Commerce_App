import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:get/get.dart';

abstract class SuccessedResetPasswordController extends GetxController{
  goToLogin();
  
}

class SuccessedResetPasswordControllerImp extends SuccessedResetPasswordController{


  @override
  goToLogin() {
     Get.offAllNamed(RoutesApp.login);
  }


  
  

}