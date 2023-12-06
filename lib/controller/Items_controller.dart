
import 'package:e_commerceapp/Data/Datasource/remote/items_data.dart';
import 'package:e_commerceapp/Data/Datasource/remote/rating_data.dart';
import 'package:e_commerceapp/controller/home_controller.dart';
import 'package:e_commerceapp/core/class/statusrequest.dart';
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/core/function/handlingdata.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchMixinController{
  initialData();
  changeSelectedCat(int val,String catval,String userid);
  getItems(String categoryid,String userid);
  // goToProductDetails(ItemModel itemModel);
}

class ItemsControllerImp extends ItemsController{

 List categories=[];
 int? selectedCat;
 String? catid;
 String? userID;
 MyServices myServices=Get.find();

 ItemsData itemsData=ItemsData(Get.find());
 StatusRequest statusRequest=StatusRequest.None;
 List data=[];

 /////Rating///////
 RatingData ratingData=RatingData(Get.find());
//  List<RatingModel> listratingData=[];
//  RatingModel? ratingModel;

 ////////////temporary initial//////
 


 Map isRating={};

  // key => id items
  // Value => ??

  setRating(id,double val){
    isRating[id]=val;
    update();
  }
  
 /////Rating////////
  
  @override
  void onInit() {
    searhitem=TextEditingController();
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories=Get.arguments["Categories"];
    selectedCat=Get.arguments["SelectedCat"];
    catid=Get.arguments["categoryid"];
    userID=Get.arguments["userid"];
    getItems(catid!,userID!);
    
    /////////////
    // getRatingsdata();
  
  }
  
  @override
changeSelectedCat(val,catval, userid) {
   selectedCat=val;
   catid=catval;
   userID=userid;
  getItems(catid!,userID!);
  // getRatingsdata();
   update();
  }
  
  @override
  getItems(categoryid,userid)async {
    data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await itemsData.getItemsData(categoryid,userid);
    statusRequest=handlingData(response);

    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        data.addAll(response['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();

    
  }
  
  @override
  goToProductDetails(itemModel) {
    Get.toNamed(RoutesApp.productdetails,
    arguments: {
      'itemsmodel':itemModel,
    });
  }
  ////////////rating/////////////////////
// setvaluerat(ra){
//    ratingval=ra;
//    update();
//  }

// getRatingsdata()async{
//   listratingData.clear();
//   print(itemid1);
//   statusRequest=StatusRequest.loading;
//   //  update();
//     var response=await ratingData.getRatingsData(myServices.sharedPref.getString("Id")!,itemid1!);
//     statusRequest=handlingData(response);
//     print(response);
//     if(StatusRequest.success==statusRequest){
//      if(response['status']=="success") {
//         List responseData=response["data"];
//         listratingData.addAll(responseData.map((e) => RatingModel.fromJson(e)));
//         print(response["data"]);
       
         
//          print("the item id is $itemid1");
//          ratingval=listratingData[0].ratingValue!.toDouble();
//          setvaluerat(ratingval);
//          print(ratingval);
      
//         }else{
//           statusRequest=StatusRequest.failure;
//         }
//     }
//     update();

// }

UpdateRatingVal(double rating,String itemid)async{
    statusRequest=StatusRequest.loading;
    print(rating);
    
    var response=await ratingData.updateRatingData(itemid,myServices.sharedPref.getString("Id")!,rating);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        // data.addAll(response['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
}



}