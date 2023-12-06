
import 'package:e_commerceapp/controller/Auth/successed_SignUpController.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformText.dart';
import 'package:get/get.dart';

class SuccessedSignUp extends StatelessWidget {
  
  const SuccessedSignUp({super.key});
 
  @override
  Widget build(BuildContext context) {
 Get.lazyPut(()=>SuccessedSignUpControllerImp());
    return Scaffold(
      appBar:  AppBar(
        title:Text( "Successed SignUp",style: Theme.of(context).textTheme.headline1,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      backgroundColor: Appcolors.background,
      body:GetBuilder<SuccessedSignUpControllerImp>
      (builder: (controller)=>Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outline,size: 200,color: Appcolors.primarycolor,),
              CustumFormText(text:"Thanks for finished SigningUp SuccessFully"),
              Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                width: double.infinity,
                child: CustumButtonAuth(text: "Go To LogIn",onPressed: () {
                      controller.goToLogin();
                    },),
              ),
             
            ],
          ),
        ) ,)
      
    );
  }
}