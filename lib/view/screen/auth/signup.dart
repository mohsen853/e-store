import 'package:estore/controller/auth/signupcontroller.dart';
import 'package:estore/core/constant/color.dart';
import 'package:estore/core/function/alertexitapp.dart';
import 'package:estore/core/function/validinput.dart';
import 'package:estore/view/widget/auth/custombuttonauth.dart';
import 'package:estore/view/widget/auth/customtextbodyauth.dart';
import 'package:estore/view/widget/auth/customtextformauth.dart';
import 'package:estore/view/widget/auth/customtexttitleauth.dart';
import 'package:estore/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller= Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("17".tr,
              style:Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey)
          ),
          backgroundColor: AppColor.backGroundColor,
          centerTitle: true,
        ),
        body:  WillPopScope(
         onWillPop: alertExitApp,
         child: Container(
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
            child: Form(
                key: controller.formState,
                child:ListView(children: [
                  SizedBox(height: 10,),
                  CustomTextTitleAuth(
                    text: "10".tr,
                  ),
                  SizedBox(height: 10,),
                  CustomTextBodyAuth(
                    text: "24".tr,
                  ),
                  SizedBox(height: 65,),
                  CustomTextFormAuth(
                    isNumber: false,
                    myController: controller.username,
                    hintText: "23".tr,
                    labelText: "20".tr,
                    iconData: Icons.person_outline,
                    valid: (val){
                      return validInput(val!, 3, 20, "username");
                    },
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    myController: controller.email,
                    hintText: "12".tr,
                    labelText: "18".tr,
                    iconData: Icons.email_outlined,
                    valid: (val){
                      return validInput(val!, 3, 40, "email");
                    },
                  ),
                  CustomTextFormAuth(
                    isNumber: true,
                    myController: controller.phone,
                    hintText: "22".tr,
                    labelText: "21".tr,
                    iconData: Icons.phone_android_outlined,
                    valid: (val){
                      return validInput(val!, 7, 11, "phone");
                    },
                  ),
                  GetBuilder<SignUpControllerImp>(
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
                  CustomButtonAuth(
                    text: "17".tr,
                    onPressed: (){
                      controller.signUp();
                    },
                  ),
                  SizedBox(height: 30,),
                  CustomTextSignUpOrSignIn(
                    textOne: "25".tr,
                    textTwo: "26".tr,
                    onTap: (){
                      controller.goToSignIn();
                    },
                  ),
                ],
                )
            )
        )
        )
    );
  }
}
