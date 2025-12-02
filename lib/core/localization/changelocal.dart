import 'package:estore/core/constant/apptheme.dart';
import 'package:estore/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController{
  Locale? language;
  MyServices myServices=Get.find();
  ThemeData appTheme=themeEnglish;

  changeLang(String langCode){
    Locale locale=Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme =langCode=="ar"?themeArabic:themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang=myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang=="ar"){
      language= Locale("ar");
      appTheme=themeArabic;
    }
    else if(sharedPrefLang=="en"){
      language= Locale("en");
      appTheme=themeEnglish;
    }
    else{
      language=Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}







