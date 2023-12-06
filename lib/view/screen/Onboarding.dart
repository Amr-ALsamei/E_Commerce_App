
import 'package:e_commerceapp/controller/onboarding_controller.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/view/widget/onboarding/custombutton.dart';
import 'package:e_commerceapp/view/widget/onboarding/customslider.dart';
import 'package:e_commerceapp/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImpllement());
    
    return  Scaffold(
      backgroundColor:Appcolors.background ,
      body: SafeArea(
        child: Column( 
          children: [
            Expanded(
              flex: 4,
              child:CustomSliderOnBoarding() ,
            ),
           Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotController(),
                  Spacer(flex: 2,),
                  CustomButton(),
                ],
              )
              )
          ],
        ),
      ),
    );
  }
}