 
 import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);

  getOffersData()async{
     var response=await crud.postData(AppLinks.offers, {});
    return response.fold((l) => l, (r) => r);
  }
 }