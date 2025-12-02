import 'package:estore/core/constant/routes.dart';
import 'package:estore/core/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware{

  MyServices myServices=Get.find();



  @override
  int? get priority=>1;

  @override
  // ignore: body_might_complete_normally_nullable
  RouteSettings? redirect(String? route){
    if(myServices.sharedPreferences.getString("onboarding") == "1"){
      return RouteSettings(
        name:FirebaseAuth.instance.currentUser == null  ?
        AppRoute.login :
        AppRoute.productScreen
      );
    }
  }
}