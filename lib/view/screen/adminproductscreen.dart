import 'package:estore/core/constant/color.dart';
import 'package:estore/core/constant/routes.dart';
import 'package:estore/core/function/alertexitapp.dart';
//import 'package:estore/view/widget/home/homebody.dart';
import 'package:estore/view/widget/home/homebodyadmin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProductScreen extends StatelessWidget {
  const AdminProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin".tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                Get.offNamed(AppRoute.adminAdd);
              },
              icon: Icon(Icons.add)
          ),
          IconButton(
              onPressed: (){
                Get.offAllNamed(AppRoute.money);
              },
              icon: Icon(Icons.account_balance_sharp)
          ),
          IconButton(
              onPressed: () async{
                await FirebaseAuth.instance.signOut();
                Get.offNamed(AppRoute.login);
              },
              icon: Icon(Icons.logout)
          ),
        ],
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: HomeBodyAdmin()
      ),
    );
  }
}