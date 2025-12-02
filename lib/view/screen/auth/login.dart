import 'package:estore/controller/auth/logincontroller.dart';
import 'package:estore/core/constant/color.dart';
import 'package:estore/core/constant/routes.dart';
import 'package:estore/core/function/alertexitapp.dart';
import 'package:estore/core/function/validinput.dart';
import 'package:estore/view/widget/auth/custombuttonauth.dart';
import 'package:estore/view/widget/auth/customtextbodyauth.dart';
import 'package:estore/view/widget/auth/customtextformauth.dart';
import 'package:estore/view/widget/auth/customtexttitleauth.dart';
import 'package:estore/view/widget/auth/logoauth.dart';
import 'package:estore/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller=Get.put(LoginControllerImp ());
    return Scaffold(
      appBar: AppBar(
        title: Text("9".tr,
            style:Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey)
        ),
        backgroundColor: AppColor.backGroundColor,
        centerTitle: true,
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
              child: Form(
                  key: controller.formState,
                  child:ListView(children: [
                    LogoAuth(),
                    SizedBox(height: 10,),
                    CustomTextTitleAuth(
                      text: "10".tr,
                    ),
                    SizedBox(height: 10,),
                    CustomTextBodyAuth(
                      text: "11".tr,
                    ),
                    SizedBox(height: 65,),
                    CustomTextFormAuth(
                      isNumber: false,
                      myController: controller.email,
                      hintText: "12".tr,
                      labelText: "18".tr,
                      iconData: Icons.email_outlined,
                      valid: (val){
                        return validInput(val!, 5, 100, "email");
                      },
                    ),
                    GetBuilder<LoginControllerImp>(
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
                    InkWell(
                      onTap: (){
                        controller.goToForgetPassword();
                      },
                      child: Text("14".tr,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    CustomButtonAuth(
                      text: "15".tr,
                      onPressed: (){
                        controller.login();
                      },
                    ),
                    SizedBox(height: 30,),
                    CustomTextSignUpOrSignIn(
                      textOne: "16".tr,
                      textTwo: "17".tr,
                      onTap: (){
                        controller.goToSignUp();
                      },
                    ),
                    SizedBox(height: 20,),
                    CustomButtonAuth(
                      text: "76".tr,
                      onPressed: (){
                        Get.offNamed(AppRoute.productScreen);
                      },
                    ),
                  ],
                  )
              )
          ),
      )
    );
  }
}
