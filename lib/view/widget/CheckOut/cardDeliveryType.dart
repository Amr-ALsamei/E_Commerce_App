import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypCheckOut extends StatelessWidget {
  final String title;
  final String imageName;
  final bool isActive;
  const CardDeliveryTypCheckOut({super.key, required this.title, required this.imageName, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 120,
                width: 120,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration:BoxDecoration(
                  color: isActive==true?Appcolors.primarycolor:null,
                  border: Border.all(width: 1,color: Appcolors.primarycolor)
                ) ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageName,
                    color:isActive==true?Colors.white:null 
                   ,width: 90,height: 90,),
                  Text(title,
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                          color: isActive==true?Colors.white:Appcolors.primarycolor),)
                ],
              ),);
  }
}