import 'package:estore/controller/onboardingcontroller.dart';
import 'package:estore/view/widget/onboarding/custombutton.dart';
import 'package:estore/view/widget/onboarding/customslider.dart';
import 'package:estore/view/widget/onboarding/dotscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2,),
                    CustomButtonOnBoarding()
                ],
                )
            )
          ],
          )
      )
    );
  }
}
