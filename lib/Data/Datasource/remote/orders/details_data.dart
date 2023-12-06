import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);

  getData(int orderId)async{
     var response=await crud.postData(AppLinks.orderdetails, {
      "orderId":orderId.toString()
     });
    return response.fold((l) => l, (r) => r);
  }
 }