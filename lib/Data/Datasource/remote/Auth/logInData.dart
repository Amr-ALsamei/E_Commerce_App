import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class LogInData {
  Crud crud;
  LogInData(this.crud);

  LogInPostData(String emal,String password)async{
     var response=await crud.postData(AppLinks.login, {
      "email":emal,
      "password":password,
     });
    return response.fold((l) => l, (r) => r);
  }
 }