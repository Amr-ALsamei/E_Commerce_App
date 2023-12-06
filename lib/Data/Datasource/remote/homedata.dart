import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getHomeData()async{
     var response=await crud.postData(AppLinks.homepag, {});
    return response.fold((l) => l, (r) => r);
  }

 searchData(String itemname)async{
     var response=await crud.postData(AppLinks.searchItem, {
      "itemName":itemname
     });
    return response.fold((l) => l, (r) => r);
  }
 }