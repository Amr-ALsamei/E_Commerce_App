
import 'package:e_commerceapp/core/constant/routesName.dart';
import 'package:e_commerceapp/core/middleware/AppMiddleWare.dart';
import 'package:e_commerceapp/view/screen/Address/add.dart';
import 'package:e_commerceapp/view/screen/Address/addressDetails.dart';
import 'package:e_commerceapp/view/screen/Address/view.dart';
import 'package:e_commerceapp/view/screen/Auth/SignApp.dart';
import 'package:e_commerceapp/view/screen/Auth/Successed_SignUp.dart';
import 'package:e_commerceapp/view/screen/Auth/forgetPassword/SuccessedResetPassword.dart';
import 'package:e_commerceapp/view/screen/Auth/forgetPassword/forgetPassword.dart';
import 'package:e_commerceapp/view/screen/ListFavoriteItems_Screen.dart';
import 'package:e_commerceapp/view/screen/Orders/TrackingScreen.dart';
import 'package:e_commerceapp/view/screen/Orders/archiveorder.dart';
import 'package:e_commerceapp/view/screen/Orders/detailsScreen.dart';
import 'package:e_commerceapp/view/screen/Orders/pendingorder.dart';
import 'package:e_commerceapp/view/screen/cartScreen.dart';
import 'package:e_commerceapp/view/screen/checkOutScreen.dart';
import 'package:e_commerceapp/view/screen/homeScreen.dart';
import 'package:e_commerceapp/view/screen/Auth/login.dart';
import 'package:e_commerceapp/view/screen/Auth/forgetPassword/resetPassword.dart';
import 'package:e_commerceapp/view/screen/Auth/forgetPassword/verfyCode.dart';
import 'package:e_commerceapp/view/screen/Auth/verfyCodeSignUp.dart';
import 'package:e_commerceapp/view/screen/ItemsScreen.dart';
import 'package:e_commerceapp/view/screen/Onboarding.dart';
import 'package:e_commerceapp/view/screen/language.dart';
import 'package:e_commerceapp/view/screen/productdetails.dart';
// import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



 List<GetPage<dynamic>>? routesPages=[
  
  GetPage(name: "/", page: ()=>Languages(),middlewares:[
    AppMiddleWare()
  ] ),
 
  GetPage(name: RoutesApp.productdetails, page: ()=>ProductDetails()),
    GetPage(name: RoutesApp.cart, page: ()=>CartScreen()),
  // GetPage(name: '/',page:()=>TestCode() ),
  GetPage(name: RoutesApp.login, page: ()=>LoginApp()),
  GetPage(name: RoutesApp.onbordingRoute, page: ()=>OnBoarding()),
  GetPage(name: RoutesApp.signapp, page: ()=>SignApp()),
  GetPage(name: RoutesApp.forgetpassword, page: ()=>ForgetPassword()),
  GetPage(name: RoutesApp.verfyCode, page: ()=>VerificationCode()),
  GetPage(name:  RoutesApp.resetpassword, page: ()=>ResetPassword()),
  GetPage(name: RoutesApp.SuccessResetPassword, page: ()=>SuccessedResetPassword()),
  GetPage(name:  RoutesApp.SuccessedSignUp, page: ()=>SuccessedSignUp()),
  GetPage(name:  RoutesApp.verfyCodeSignUp, page: ()=>VerificationCodeSignUp()),
  // GetPage(name: RoutesApp.homepage, page: ()=>HomePage()),
   GetPage(name: RoutesApp.homepage, page: ()=>HomeScreen()),
   GetPage(name: RoutesApp.items, page: ()=>ItemsScreen()),
   GetPage(name: RoutesApp.favoriteItems, page:()=> ListFavoriteItems()),
   //////////Address/////////////////////////////////////
   GetPage(name: RoutesApp.addressview, page: ()=>AddressViews()),
   GetPage(name: RoutesApp.addressadd, page: ()=>AddressAdd()),
   GetPage(name: RoutesApp.addressadddetails, page: ()=>AddressDetails()),
   //////////////////Orders///////////////////////////////////////////
   GetPage(name: RoutesApp.checkout, page: ()=>CheckOutScreen()),
   GetPage(name: RoutesApp.pendingorderpage, page: ()=>PendingOrderScreen()),
   GetPage(name: RoutesApp.archiveorderpage, page: ()=>ArchiveOrderScreen()),
   GetPage(name: RoutesApp.ordersdetailspage, page: ()=>OrdersDetailsScreen()),
    GetPage(name: RoutesApp.orderstrackingpage, page: ()=>OrdersTrackinScreen()),
 ];



// Map <String,Widget Function(BuildContext)> routes={
//  RoutesApp.login:(Context) => LoginApp(),
//  RoutesApp.onbordingRoute:(Context) => OnBoarding(),
//  RoutesApp.signapp:(Context) => SignApp(),
//  RoutesApp.forgetpassword:(Context) =>  ForgetPassword(),
//  RoutesApp.verfyCode:(Context) =>  VerificationCode(),
//  RoutesApp.resetpassword:(Context) =>  ResetPassword(),
//  RoutesApp.SuccessResetPassword:(Context) => SuccessedResetPassword(),
//  RoutesApp.SuccessedSignUp:(Context) => SuccessedSignUp(),
//  RoutesApp.verfyCodeSignUp:(Context) => VerificationCodeSignUp(),

 
// };