
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CountAndPriceOfItems extends StatelessWidget {
 final void Function() onAdd;
 final void Function() onRemove;
 final String itemcount;
 final String itemprice;
  const CountAndPriceOfItems({super.key,required this.onAdd,required this.onRemove, required this.itemcount, required this.itemprice});


  @override
  Widget build(BuildContext context) {
    return  Row(children: [
                Row(children: [
                  IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Appcolors.fourthcolor,
                      border: Border.all(color: Appcolors.fourthcolor),
                      borderRadius: BorderRadius.circular(8)),
                    child:Text("${itemcount}",
                    style: const TextStyle(height: 1.1,fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),) 
                    ,),

                  IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),

                ],),
                Spacer(),
                Text("${itemprice}\$",
                style:TextStyle(height: 1.1,fontSize: 20,fontWeight: FontWeight.bold,color: Appcolors.primarycolor) ,)
              ],);
  }
}