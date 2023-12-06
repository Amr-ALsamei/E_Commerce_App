 
 import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getItemsData(String id, String userid)async{
     var response=await crud.postData(AppLinks.Itemspag,
      {"id":id.toString()
      ,"userid":userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  


 }