import 'package:e_commerceapp/controller/Auth/loginController.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/function/AlertExitApp.dart';
import 'package:e_commerceapp/core/function/validator.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformText.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformfield.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customtextSignup&signIn.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/logoAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>LogInControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:Text( "Sign In",style: Theme.of(context).textTheme.headline1,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      body:GetBuilder<LogInControllerImp>(
        builder: (controller)=> WillPopScope(
          onWillPop: AlertExitApp,
          child: HandlingDataRequest(statusRequest: controller.statusRequest,
            widget: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
                    children: [
                     LogoAuth(),
                     const CustumFormLable(label: "Welcome Back",),
                  
                     const SizedBox(height: 10,),
                   const  CustumFormText(text: "Sign In with your Email and Password OR Continuoue with Social Media"),
                  
                    // const SizedBox(height: 30,),
                      Form(
                        key: controller.formstate,
                        child: Column(
                        children: [
                          CustumFormField(
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 5, 100, "email");
                            },
                            label:"Email" ,hinttext: "Enter Your Email",
                          icon: Icons.email_outlined,
                          mycontroller: controller.email),
                          // const SizedBox(height: 25,),
                          GetBuilder<LogInControllerImp>(builder: (controller){
                            return CustumFormField(
                            obsecureText: controller.isShowPassword,
                            onTapIcon: () => controller.ShowPassword(),
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 5, 30, "password");
                            },
                            label:"PassWord" ,hinttext: "Enter Your PassWord",
                          icon: Icons.lock_outline,
                          mycontroller: controller.password
                          );
                          })
                          
                        ],
                
                      ) ),
                      SizedBox(height: 20,),
                      InkWell(onTap: () {
                        controller.goToForgetPassword();
                      },
                        child: Text("Forget PassWord",textAlign: TextAlign.end,)),
                  
                      CustumButtonAuth(text: "Sign In",onPressed: () {
                        controller.login();
                      },),
                      // SizedBox(height: 15,),
                      CustumTextSignUpORSignIn(txt1: "Don't have an account ?",
                       txt2: "Sign Up",onTap:(){
                         controller.goToSignUp();
                         },)
                    ],
                  ),
                ),
          ),
              
        ),)
      
    );
  }
}