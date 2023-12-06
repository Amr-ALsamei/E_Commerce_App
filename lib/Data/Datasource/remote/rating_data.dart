 
 import 'package:e_commerceapp/core/class/Crud.dart';
import 'package:e_commerceapp/linkAPI.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);

  updateRatingData(String itemid, String userid,double ratingval)async{
     var response=await crud.postData(AppLinks.updaterating,
      { 
        "itemid":itemid.toString(),
        "userid":userid.toString(),
        "ratingval":ratingval.toString()});
    return response.fold((l) => l, (r) => r);
  }


 }