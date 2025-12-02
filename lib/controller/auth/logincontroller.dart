import 'package:estore/core/constant/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;
  bool isLoading = false;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      try {
        isLoading = true;
        update();

        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );

        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .get();

        if (userDoc.exists) {
          bool isAdmin = userDoc.get('isAdmin') ?? false;

          if (isAdmin) {
            Get.offNamed(AppRoute.adminProductScreen);
          } else {
            Get.offNamed(AppRoute.productScreen);
          }
        }
      } on FirebaseAuthException catch (e) {
        isLoading = false;
        update();

        String errorMessage;
        if (e.code == 'user-not-found') {
          errorMessage = "85".tr;
        } else if (e.code == 'wrong-password') {
          errorMessage = "86".tr;
        } else if (e.code == 'invalid-email') {
          errorMessage = "87".tr;
        } else {
          errorMessage = "88 ${"${e.message}".tr}";
        }

        Get.snackbar(
          "89".tr,
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } catch (e) {
        isLoading = false;
        update();

        Get.snackbar(
          "83".tr,
          "90".tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        isLoading = false;
        update();
      }
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}