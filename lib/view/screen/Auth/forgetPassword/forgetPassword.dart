import 'package:e_commerceapp/controller/Auth/forgetpasswordController.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/function/validator.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformText.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformfield.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/logoAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:Text( "Forget Password",style: Theme.of(context).textTheme.headline1,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller)=>Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: HandlingDataRequest(statusRequest: controller.statusRequest,
          widget: ListView(
                  children: [
                   LogoAuth(),
                   const CustumFormLable(label: "Check Email",),
        
                   const SizedBox(height: 10,),
                 const  CustumFormText(text: "Enter your Email to ensure you account with verfiycode and Reset the Password"),
        
                  const SizedBox(height: 30,),
                    Form(
                      key:controller.formstateforgetpassword ,
                      child: Column(
                      children: [
                        CustumFormField(
                          isNumber: false,
                          valid: (val) {
                          return  ValidInput(val!, 5, 100, "email");
                          },
                          label:"Email" ,hinttext: "Enter Your Email",
                        icon: Icons.email_outlined,
                        mycontroller: controller.email),
                        const SizedBox(height: 25,),
                        
                        
                      ],
              
                    ) ),
                    SizedBox(height: 30,),
                   
                    CustumButtonAuth(text: "Check",onPressed: () {
                       controller.CheckEmail();
                    },),
                   
                  ],
                ),
        ),
      ),)
      
    );
  }
}