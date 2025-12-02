import 'package:estore/controller/onboardingcontroller.dart';
import 'package:estore/core/constant/color.dart';
import 'package:estore/data/datasource/Static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder:(controller)=>Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                onBoardingList.length,
                    (index)=>AnimatedContainer(
                  margin: EdgeInsets.only(right: 5),
                  duration: Duration(microseconds: 900),
                  width: controller.currentPage==index ? 20 : 5  ,
                  height: 6,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                )
            )
          ],
        )
    );
  }
}
