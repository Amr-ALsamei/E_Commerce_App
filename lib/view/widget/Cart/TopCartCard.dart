import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class TopCartCard extends StatelessWidget {
  final String number;
  const TopCartCard({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color:Appcolors.thirdcolor ,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text("You have ${number} Items in your List",textAlign: TextAlign.center,),
          );
  }
}