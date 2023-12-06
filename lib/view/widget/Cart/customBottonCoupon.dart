import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButtonCoupon({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      child: MaterialButton(
            color: Appcolors.primarycolor,
            onPressed: onPressed,child: Text(title,
            style: TextStyle(fontSize: 15,
            color: Colors.white,fontWeight: FontWeight.bold),)
            ,),
    );
  }
}