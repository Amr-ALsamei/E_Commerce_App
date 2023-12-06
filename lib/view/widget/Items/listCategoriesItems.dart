import 'package:e_commerceapp/Data/Model/categoriesmodel.dart';
import 'package:e_commerceapp/controller/Items_controller.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/function/TranslationdataBase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                  height: 100,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 10,),
                     itemCount: controller.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                             int i=index;
                            return CategoriesHom(categoriesModel: CategoriesModel.fromJson(controller.categories[index])
                            ,i) ;
                    }),
                );
  }

}


class CategoriesHom extends GetView<ItemsControllerImp> {
 final CategoriesModel categoriesModel;
 final int i;
 CategoriesHom(this.i, {super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeSelectedCat(i,categoriesModel.categoryID.toString(),controller.userID!);
      },
      child: GetBuilder<ItemsControllerImp>(
        builder: (controller) {
          return Column(children: [
                                
                         Container(
                          decoration:controller.selectedCat==i? const BoxDecoration(
                            border: Border(
                             bottom: BorderSide(width: 3,color: Appcolors.primarycolor) 
                            )
                          ):null,
                          child: Text(translateDataBase("${categoriesModel.categoryNameAr}", "${categoriesModel.categoryName}")
                            ,style: TextStyle(fontSize: 15),))
                                  ],
                                );
        }
      ),
    );
  }

}