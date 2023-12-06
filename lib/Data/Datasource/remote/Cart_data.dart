 
 import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  AddCartData(String userid,String itemid)async{
     var response=await crud.postData(AppLinks.AddCart,
      {"userid":userid.toString()
      ,"itemid":itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  DeleteCartData(String userid,String itemid)async{
     var response=await crud.postData(AppLinks.deleteCart,
      {"userid":userid.toString()
      ,"itemid":itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

   getCountCart(String userid,String itemid)async{
     var response=await crud.postData(AppLinks.cartgetcountItems,
      {"userId":userid.toString()
      ,"itemId":itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  ViewCartData(String userid)async{
     var response=await crud.postData(AppLinks.viewCart,
      {"userId":userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  
   checkCouponData(String couponname)async{
     var response=await crud.postData(AppLinks.checkcoupon,
      {"couponName":couponname.toString()});
    return response.fold((l) => l, (r) => r);
  }
 
//  DeleteFavoriteItem(String favoriteid)async{
//      var response=await crud.postData(AppLinks.FavoritedeleteItem,
//       {"favoriteId":favoriteid.toString()});
//     return response.fold((l) => l, (r) => r);
//   }

 }