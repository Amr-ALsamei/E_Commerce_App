import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomCartButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomCartButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only( bottom: 40,left: 20,right: 20),
      width: double.infinity,
      child: MaterialButton(
            color: Appcolors.primarycolor,
            onPressed: onPressed,child: Text("Place order",
            style: TextStyle(fontSize: 20,
            color: Colors.white,fontWeight: FontWeight.bold),)
            ,),
    );
  }
}