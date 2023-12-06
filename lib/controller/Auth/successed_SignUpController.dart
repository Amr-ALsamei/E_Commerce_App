import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:get/get.dart';

abstract class SuccessedSignUpController extends GetxController{
  goToLogin();
  
}

class SuccessedSignUpControllerImp extends SuccessedSignUpController{


  @override
  goToLogin() {
     Get.offAllNamed(RoutesApp.login);
  }


  
  

}