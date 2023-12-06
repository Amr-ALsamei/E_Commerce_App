import 'package:e_commerceapp/controller/Auth/signUpController.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/function/AlertExitApp.dart';
import 'package:e_commerceapp/core/function/validator.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformText.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformfield.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customtextSignup&signIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignApp extends StatelessWidget {
  const SignApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:Text( "Sign Up",style: Theme.of(context).textTheme.headline1,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder:(controller)=>  WillPopScope(
          onWillPop: AlertExitApp,
          child: HandlingDataRequest(statusRequest: controller.statusRequest,
            widget: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
                    children: [
                     
                     const CustumFormLable(label: "Welcome Back",),
                  
                     const SizedBox(height: 10,),
                   const  CustumFormText(text: "Sign Up with your Email and Password OR Continuoue with Social Media"),
                  
                    const SizedBox(height: 30,),
                      Form(
                        key:controller.formstateSignUp ,
                        child: Column(
                        children: [
                           CustumFormField(
                            isNumber: false,
                            valid: (val) {
                            return  ValidInput(val!, 5, 50, "username");
                            },
                            label:"Name" ,hinttext: "Enter Your UserName",
                          icon: Icons.person_outline,
                          mycontroller: controller.userName),
                          
                  
                          CustumFormField(
                            isNumber: false,
                            valid: (val) {
                            return  ValidInput(val!, 5, 100, "email");
                            },
                            label:"Email" ,hinttext: "Enter Your Email",
                          icon: Icons.email_outlined,
                          mycontroller: controller.email),
                          
                           CustumFormField(
                            isNumber: true,
                            valid: (val) {
                             return ValidInput(val!, 9, 15, "phone");
                            },
                            label:"phone" ,hinttext: "Enter Your Phone",
                          icon: Icons.phone_android_outlined,
                          mycontroller: controller.phonNumber),
                          
                          GetBuilder<SignUpControllerImp>(
                            builder: (controller){
                              return CustumFormField(
                                obsecureText: controller.isShowPassWord,
                                onTapIcon: () => controller.ShowPassWord(),
                              isNumber: false,
                              valid: (val) {
                                 return ValidInput(val!, 5, 30, "password");
                            },
                            label:"PassWord" ,hinttext: "Enter Your PassWord",
                            icon: Icons.lock_outline,
                            mycontroller:controller.password);
                          }),
                          
                        ],
                
                      ) ),
                      SizedBox(height: 30,),
                     
                      CustumButtonAuth(text: "Sign Up",onPressed: () {
                        controller.signUp();
                      },),
                      SizedBox(height: 20,),
                      CustumTextSignUpORSignIn(txt1:"have an account ?",
                      txt2:"Sign In" ,
                      onTap: () {
                        controller.goToLogIn();
                      },
                      ),
                     
                    ],
                  ),
                ),
          ),
        ), )
      
    );
  }
}