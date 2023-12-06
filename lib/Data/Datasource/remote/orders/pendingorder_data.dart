 
 import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class PendingOrderData {
  Crud crud;
  PendingOrderData(this.crud);

  getPendingData(String userid)async{
     var response=await crud.postData(AppLinks.pendingorder, {
      "userId":userid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }

  DeletePendingData(String orderid)async{
     var response=await crud.postData(AppLinks.orderdelete, {
      "orderId":orderid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }
 }
