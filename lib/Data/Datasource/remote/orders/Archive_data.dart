 
 import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class ArchiveOrderData {
  Crud crud;
  ArchiveOrderData(this.crud);

  getArchiveData(String userid)async{
     var response=await crud.postData(AppLinks.archiveorder, {
      "userId":userid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }

  RatingOrdersData(String orderid,String comment,String rate)async{
     var response=await crud.postData(AppLinks.orderrating, {
      "orderId":orderid.toString(),
      "comment":comment.toString(),
      "rating": rate.toString()
     });
    return response.fold((l) => l, (r) => r);
  }

  
 }
