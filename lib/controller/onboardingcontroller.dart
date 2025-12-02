import 'package:estore/core/constant/routes.dart';
import 'package:estore/core/services/services.dart';
import 'package:estore/data/datasource/Static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage=0;
  late PageController pageController;
  MyServices myServices=Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage>onBoardingList.length-1){
        myServices.sharedPreferences.setString("onboarding", "1");
        Get.offAllNamed(AppRoute.login);
    }
    else{
      pageController.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 900),
          curve: Curves.easeInOut
      );
    }

  }

  @override
  onPageChanged(int index) {
      currentPage=index;
      update();
  }
  @override
  void onInit(){
    pageController=PageController();
    super.onInit();
  }
}