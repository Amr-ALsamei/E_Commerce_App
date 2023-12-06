import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CardShippingAddressCheckOut extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;
  const CardShippingAddressCheckOut({super.key, required this.title, required this.body, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Card(
            color:isActive==true? Appcolors.primarycolor:Colors.grey[200],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child:  ListTile(
            title: Text(
              title,style: TextStyle(fontWeight: FontWeight.bold,
                  color:isActive==true? Colors.white:Appcolors.primarycolor),),
            subtitle: Text(body,style: TextStyle(fontWeight: FontWeight.bold,
                 color:isActive==true? Colors.white:Appcolors.primarycolor)),
          ),);
  }
}