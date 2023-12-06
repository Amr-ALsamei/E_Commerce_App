 
 import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class CheckOutData {
  Crud crud;
  CheckOutData(this.crud);

  postCheckOuData(Map data)async{
     var response=await crud.postData(AppLinks.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
 }