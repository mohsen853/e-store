import 'package:estore/controller/onboardingcontroller.dart';
import 'package:estore/core/constant/color.dart';
import 'package:estore/data/datasource/Static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val){
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context,i)=>Column(children: [
          Text(
            onBoardingList[i].title!,
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: AppColor.black
            ) ,
          ),
          SizedBox(height: 80,),
          Image.asset(
            onBoardingList[i].image!,
            height: 230,
            width: 200,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 80,),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 2,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ) ,
            ),
          )
        ],)
    );
  }
}
