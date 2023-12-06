
import 'package:e_commerceapp/controller/Auth/verify_controller_SignUp.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:e_commerceapp/view/widget/Auth_FormFields/customformText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class VerificationCodeSignUp extends StatelessWidget {
  const VerificationCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>VerificationControllerSignUpImp());
    return Scaffold(
      appBar: AppBar(
        title:Text( "Verification Code",style: Theme.of(context).textTheme.headline1,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      body:GetBuilder<VerificationControllerSignUpImp>(
        builder: (controller)=> Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: HandlingDataRequest(statusRequest: controller.statusRequest,
          widget: ListView(
                  children: [
                  
                   const CustumFormLable(label: "Check Code",),
        
                   const SizedBox(height: 10,),
                   CustumFormText(text: "Please Enter The Digit Code Sent To ${controller.email}"),
        
                  const SizedBox(height: 30,),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(20),
                      numberOfFields: 5,
                      borderColor: Appcolors.primarycolor,
                      showFieldAsBox: true,
                      onCodeChanged: (String Code) => null,
                      onSubmit: (String VerificationCode) {
                        controller.goToSuccessSignUp(VerificationCode);
                      },
                    ),
                    SizedBox(height: 30,),
                   InkWell(onTap: () {
                       controller.Resend();
                   },
                   child: Center(child:Text("Resend verfiy code",style: TextStyle(fontSize: 20,color: Appcolors.primarycolor),) ,),)
                    
                   
                  ],
                ),
        ),
      ),)
      
    );
  }
}