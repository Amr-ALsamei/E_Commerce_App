 
 import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  AddFavorite(String userid,String itemid)async{
     var response=await crud.postData(AppLinks.FavoriteAdd,
      {"userid":userid.toString()
      ,"itemid":itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  RemoveFavorite(String userid,String itemid)async{
     var response=await crud.postData(AppLinks.FavoriteRemove,
      {"userid":userid.toString()
      ,"itemid":itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  ViewFavoriteItems(String userid)async{
     var response=await crud.postData(AppLinks.FavoriteviewItem,
      {"userId":userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
 
 DeleteFavoriteItem(String favoriteid)async{
     var response=await crud.postData(AppLinks.FavoritedeleteItem,
      {"favoriteId":favoriteid.toString()});
    return response.fold((l) => l, (r) => r);
  }

 }