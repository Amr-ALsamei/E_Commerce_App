 
 import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData()async{
     var response=await crud.postData(AppLinks.test, {});
    return response.fold((l) => l, (r) => r);
  }
 }