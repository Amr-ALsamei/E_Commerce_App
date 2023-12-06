import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  SignupPostData(String username,String password,String emal,String phone)async{
     var response=await crud.postData(AppLinks.signup, {
      "username":username,
      "password":password,
      "email":emal,
      "phone":phone,
     });
    return response.fold((l) => l, (r) => r);
  }
 }