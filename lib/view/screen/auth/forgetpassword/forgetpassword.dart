import 'package:estore/controller/auth/forgetpasswordcontroller.dart';
import 'package:estore/core/constant/color.dart';
import 'package:estore/core/function/validinput.dart';
import 'package:estore/view/widget/auth/custombuttonauth.dart';
import 'package:estore/view/widget/auth/customtextbodyauth.dart';
import 'package:estore/view/widget/auth/customtextformauth.dart';
import 'package:estore/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller= Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("14".tr,
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
                    text: "27".tr,
                  ),
                  SizedBox(height: 10,),
                  CustomTextBodyAuth(
                    text: "29".tr,
                  ),
                  SizedBox(height: 65,),
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
                  SizedBox(height: 10,),
                  CustomButtonAuth(
                    text: "30".tr,
                    onPressed: (){
                      controller.goToVerifyCode();
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
