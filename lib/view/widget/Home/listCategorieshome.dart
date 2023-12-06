import 'package:e_commerceapp/Data/Model/categoriesmodel.dart';
import 'package:e_commerceapp/controller/home_controller.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:e_commerceapp/core/function/TranslationdataBase.dart';
import 'package:e_commerceapp/linkAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

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


class CategoriesHom extends GetView<HomeControllerImp> {
 final CategoriesModel categoriesModel;
 final int i;
 CategoriesHom(this.i, {super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories,i,categoriesModel.categoryID.toString());
      },
      child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Appcolors.thirdcolor,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 70,
                                  width: 70,
                                  child:  SvgPicture.network("${AppLinks.imagecategories}/${categoriesModel.categoryImage}",
                                        // ignore: deprecated_member_use
                                        color: Appcolors.black,
                                        
                                ) ,
                                ),
                                Text(translateDataBase("${categoriesModel.categoryNameAr}", "${categoriesModel.categoryName}"))
                              ],
                            ),
    );
  }

}