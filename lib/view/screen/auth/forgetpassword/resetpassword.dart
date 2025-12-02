import 'package:estore/controller/auth/resetpasswordcontroller.dart';
import 'package:estore/core/constant/color.dart';
import 'package:estore/core/function/validinput.dart';
import 'package:estore/view/widget/auth/custombuttonauth.dart';
import 'package:estore/view/widget/auth/customtextbodyauth.dart';
import 'package:estore/view/widget/auth/customtextformauth.dart';
import 'package:estore/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller= Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("41".tr,
              style:Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey)
          ),
          backgroundColor: AppColor.backGroundColor,
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
            child: Form(
                key: controller.formState,
                child:ListView(children: [
                  SizedBox(height: 10,),
                  CustomTextTitleAuth(
                    text: "35".tr,
                  ),
                  SizedBox(height: 10,),
                  CustomTextBodyAuth(
                    text: "35".tr,
                  ),
                  SizedBox(height: 65,),
                  GetBuilder<ResetPasswordControllerImp>(
                    builder: (controller)=>CustomTextFormAuth(
                      onTapIcon: (){
                        controller.showPassword();
                      },
                      obscureText: controller.isShowPassword,
                      isNumber: false,
                      myController: controller.password,
                      hintText: "13".tr,
                      labelText: "19".tr,
                      iconData: Icons.lock_outlined,
                      valid: (val){
                        return validInput(val!, 5, 30, "password");
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  GetBuilder<ResetPasswordControllerImp>(
                    builder: (controller)=>CustomTextFormAuth(
                      onTapIcon: (){
                        controller.showPassword();
                      },
                      obscureText: controller.isShowPassword,
                      isNumber: false,
                      myController: controller.password,
                      hintText: "42".tr,
                      labelText: "19".tr,
                      iconData: Icons.lock_outlined,
                      valid: (val){
                        return validInput(val!, 5, 30, "password");
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomButtonAuth(
                    text: "33".tr,
                    onPressed: (){
                      controller.goToSuccessResetPassword();
                    },
                  ),
                  SizedBox(height: 30,),
                ],
                )
            )
        )
    );
  }
}
