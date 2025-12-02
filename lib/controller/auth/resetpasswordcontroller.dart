import 'package:estore/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController{

  GlobalKey<FormState> formState=GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController rePassword;
  bool isShowPassword= true;

  showPassword(){
    isShowPassword=isShowPassword==true?false:true;
    update();
  }

  @override
  resetPassword() {

  }

  @override
  goToSuccessResetPassword() {
    if(formState.currentState!.validate()) {
      Get.offAllNamed(AppRoute.successResetPassword);
    }
  }

  @override
  void onInit() {
    password=TextEditingController();
    rePassword=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }

}