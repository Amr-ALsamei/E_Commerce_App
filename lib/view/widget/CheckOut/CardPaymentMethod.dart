import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CardPayMentMethodCheckOut extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPayMentMethodCheckOut({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            decoration: BoxDecoration(
              color:isActive==true? Appcolors.primarycolor:Appcolors.thirdcolor,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
            ),
            );
  }
}