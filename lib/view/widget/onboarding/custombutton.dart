import 'package:estore/controller/onboardingcontroller.dart';
import 'package:estore/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        onPressed: (){
          controller.next();
        },
        padding: EdgeInsets.symmetric(horizontal: 100,vertical: 0),
        textColor: Colors.white,
        color: AppColor.primaryColor,
        child:Text("8".tr),
      ),
    );
  }
}
