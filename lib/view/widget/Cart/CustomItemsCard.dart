import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/linkAPI.dart';
import 'package:flutter/material.dart';

class CustomItemsCard extends StatelessWidget {
 final String itemname;
 final String itemprice;
 final String itemcount;
 final String imagename;
 final void Function() onAdd;
 final void Function() onRemove;

  const CustomItemsCard({super.key, required this.itemname, required this.itemprice, required this.itemcount, required this.imagename,required this.onAdd,required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
                  child: Container(
                    child:Row(children: [
                      Expanded(
                        flex: 2,
                        child: CachedNetworkImage(imageUrl: "${AppLinks.imageitem}/${imagename}",height: 100,)),
                      Expanded(
                        flex: 3,
                        child: ListTile(title: Text(itemname),
                                         subtitle:Text(itemprice,style: TextStyle(fontSize: 20,color: Appcolors.primarycolor),) ,)),
                       Expanded(
                         flex: 1,
                        child: Column(children: [
                        IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                        Container(child: Text(itemcount,style: TextStyle(fontFamily: "sans"),),),
                        IconButton(onPressed: onRemove, icon: Icon(Icons.remove))
                      ],))
                    ],) ,
                  ),
                );
  }
}