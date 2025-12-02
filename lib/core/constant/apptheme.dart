import 'package:estore/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: TextTheme(
      headlineLarge:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: AppColor.black
      ) ,
      headlineMedium:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: AppColor.black
      ),
      bodyLarge:TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 20
      )
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
      headlineLarge:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: AppColor.black
      ) ,
      headlineMedium:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: AppColor.black
      ),
      bodyLarge:TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 20
      )
  ),
  primarySwatch: Colors.blue,
);