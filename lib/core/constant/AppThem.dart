
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

ThemeData themEnglish=ThemeData(
   appBarTheme: AppBarTheme(
    color: Appcolors.primarycolor,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: Appcolors.grey),
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)
   ),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Appcolors.primarycolor
   ),
    fontFamily: "PlayfairDisplay",
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Appcolors.black,
        height: 3),
      headline2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: Appcolors.black),
      bodyText1: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: Appcolors.grey,
        fontSize: 14,),
      bodyText2: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: Appcolors.grey,
        fontSize: 14,),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
    );

    ThemeData themArabic=ThemeData(
    fontFamily: "Cairo",
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Appcolors.black,
        height: 3),
      headline2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: Appcolors.black),
      bodyText1: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: Appcolors.grey,
        fontSize: 14,),
      bodyText2: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: Appcolors.grey,
        fontSize: 14,),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    );