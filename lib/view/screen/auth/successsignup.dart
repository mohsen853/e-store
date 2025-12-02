import 'package:estore/controller/auth/successsignupcontroller.dart';
import 'package:estore/core/constant/color.dart';
import 'package:estore/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller=Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("32".tr,
            style:Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey)
        ),
        backgroundColor: AppColor.backGroundColor,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text("37".tr,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 30),
            ),
            SizedBox(height: 20,),
            Text("38".tr),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "31".tr,
                onPressed: (){
                  controller.goToPageLogin();
                },
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
