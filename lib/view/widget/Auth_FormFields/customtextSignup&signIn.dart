import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustumTextSignUpORSignIn extends StatelessWidget {
  final String txt1;
  final String txt2;
  final Function()? onTap;
  const CustumTextSignUpORSignIn({super.key, required this.txt1, required this.txt2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(txt1),
                    InkWell(
                      onTap: onTap,
                      child:Text(txt2,style: TextStyle(fontSize: 15,color: Appcolors.primarycolor,fontWeight: FontWeight.bold),) ,
                    )
                  ],);
  }
}