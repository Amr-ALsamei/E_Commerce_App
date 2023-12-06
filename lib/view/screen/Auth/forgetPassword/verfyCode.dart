
import 'package:e_commerceapp/controller/Auth/verify_controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
 Get.lazyPut(()=>VerificationControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:Text( "Verification Code",style: Theme.of(context).textTheme.headline1,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      body: GetBuilder<VerificationControllerImp>(
        builder: (controller)=>Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: HandlingDataRequest(statusRequest: controller.statusRequest,
          widget: ListView(
                  children: [
                  
                   const CustumFormLable(label: "Check Code",),
        
                   const SizedBox(height: 10,),
                 const  CustumFormText(text: "Sign In with your Email and Password OR Continuoue with Social Media"),
        
                  const SizedBox(height: 30,),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(20),
                      numberOfFields: 5,
                      borderColor: Appcolors.primarycolor,
                      showFieldAsBox: true,
                      onCodeChanged: (String Code) => null,
                      onSubmit: (String Verification) {
                        controller.goToResetPassword(Verification);
                      },
                    ),
                    SizedBox(height: 30,),
                   
                    
                   
                  ],
                ),
        ),
      ),)
      
    );
  }
}