class AppLinks{

  static const String server="http://10.0.2.2/E_Commerce";
  static const String test="$server/test.php";

  static const String imagestatic="$server/upload";
  // ======================images============================
  static const String imagecategories="$imagestatic/categories";
  static const String imageitem="$imagestatic/item";
  // ======================================================
 
  //****************Auth***************** */
  static const String signup="$server/Auth/signUp.php";
  static const String verfycode="$server/Auth/verfiycode.php";
  static const String login="$server/Auth/login.php";
  static const String resendVerfycode="$server/Auth/Resend.php";

  /////////////////forget password//////////////////////
  static const String chechemail="$server/ForgetPassword/checkEmail.php";
  static const String verfiycodeforgetpass="$server/ForgetPassword/verfycode.php";
  static const String resetpassword="$server/ForgetPassword/ResetPassword.php";

  ///////////home/////////////////////////
  static const String homepag="$server/home.php";

  /////////////////////////items////////////
  static const String Itemspag="$server/Item/items.php";
  static const String searchItem="$server/Item/search.php";

  //////////////////Favorite//////////////////
  static const String FavoriteAdd="$server/Favorite/add.php";
  static const String FavoriteRemove="$server/Favorite/remove.php";
  static const String FavoriteviewItem="$server/Favorite/ViewItems.php";
  static const String FavoritedeleteItem="$server/Favorite/deletefavorite.php";

  /////////////Cart//////////////////////////////////////
  static const String AddCart="$server/Cart/Addcart.php";
  static const String deleteCart="$server/Cart/deleteCart.php";
  static const String viewCart="$server/Cart/viewcart.php";
  static const String cartgetcountItems="$server/Cart/getCountItems.php";

  /////////////Address//////////////////////////////////////
  static const String AddAddress="$server/Address/Add.php";
  static const String deleteAddress="$server/Address/delete.php";
  static const String viewAddress="$server/Address/view.php";
  static const String editAddress="$server/Address/edit.php";

  //////////////coupon/////////////////////
  static const String checkcoupon="$server/Coupon/checkCoupon.php";

  //////////////orders/////////////////////////
  static const String checkout="$server/Orders/checkOut.php";
  static const String pendingorder="$server/Orders/pendingorder.php";
  static const String archiveorder="$server/Orders/archiveorder.php";
  static const String orderdetails="$server/Orders/details.php";
  static const String orderdelete="$server/Orders/delete.php";
  static const String orderrating="$server/Orders/ordersRating.php";

  ///////////////Notification////////////////////
  static const String notifications="$server/Notification.php";

  /////////////Offers//////////////////
  static const String offers="$server/offers.php";

  /////////////Rating//////////////////////
  static const String updaterating="$server/Rating/Updaterating.php";
  

  
}