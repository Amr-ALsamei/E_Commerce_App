import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  // ignore: non_constant_identifier_names
  CheckEmailPostData(String emal)async{
     var response=await crud.postData(AppLinks.chechemail, {
      "email":emal,
     });
    return response.fold((l) => l, (r) => r);
  }
 }