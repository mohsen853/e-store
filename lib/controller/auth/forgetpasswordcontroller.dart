import 'package:estore/core/constant/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{

  GlobalKey<FormState> formState=GlobalKey<FormState>();

  late TextEditingController email;


  @override
  goToVerifyCode() async{
    if(formState.currentState!.validate()) {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      Get.offNamed(AppRoute.successResetPassword);
    }
  }

  @override
  void onInit() {
    email=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

}