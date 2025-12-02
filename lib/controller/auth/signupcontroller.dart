import 'package:estore/core/constant/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  toggleUserType();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  bool isShowPassword = true;
  bool isAdmin = false;
  bool isLoading = false;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  toggleUserType() {
    isAdmin = !isAdmin;
    update();
  }

  @override
  signUp() async {
    if (formState.currentState!.validate()) {
      try {
        isLoading = true;
        update();

        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );

        String uid = userCredential.user!.uid;

        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username': username.text,
          'email': email.text,
          'phone': phone.text,
          'isAdmin': isAdmin,
          'createdAt': FieldValue.serverTimestamp(),
          'uid': uid,
        });
        Get.offAllNamed(AppRoute.successSignUp);
      } on FirebaseAuthException catch (e) {
        isLoading = false;
        update();

        String errorMessage;
        if (e.code == 'weak-password') {
          errorMessage = "80".tr;
        } else if (e.code == 'email-already-in-use') {
          errorMessage = "81".tr;
        } else {
          errorMessage = "${"82".tr}:  ${e.message}";
        }
        Get.snackbar(
          "104".tr,
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
          "84".tr,
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
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}