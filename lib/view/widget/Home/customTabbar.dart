import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
 final String hinttext;
 final void Function()? onPressedIcon;
 final void Function()? onPressedSearch;
 final void Function()? onFavorite;
 final void Function(String)? onChanged;
 final TextEditingController mycontroller;
   CustomTabBar (
    {super.key, 
    required this.hinttext,
    required this.onPressedIcon,
     this.onPressedSearch,
     required this.onFavorite,
     required this.onChanged, 
     required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: mycontroller,
                       onChanged:onChanged ,
                      decoration: InputDecoration(
                        prefixIcon:IconButton(onPressed: onPressedSearch,
                         icon: Icon(Icons.search,size: 30,)) ,
                        hintText: hinttext,
                        hintStyle:TextStyle(fontSize: 18) ,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        filled: true,
                        fillColor: Colors.grey[200]
                      ),
                    )),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)
                      ),
                      width: 60,
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: IconButton(onPressed: onPressedIcon, 
                    icon: Icon(Icons.notifications_active_outlined,size: 40,)
                    ),),
                    //////////////////////////////////
                     SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)
                      ),
                      width: 60,
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: IconButton(onPressed: onFavorite, 
                    icon: Icon(Icons.favorite,size: 40,)
                    ),)
                  ],
                ),
              );
  }
}