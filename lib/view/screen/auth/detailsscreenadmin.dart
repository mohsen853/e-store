import 'package:estore/core/constant/routes.dart';
import 'package:estore/data/model/productadmin.dart';
import 'package:estore/view/widget/details/detailsbodyadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreenAdmin extends StatelessWidget {
  const DetailsScreenAdmin({super.key,required this.productAdmin});

  final ProductAdmin productAdmin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Get.offNamed(AppRoute.adminProductScreen);
            },
            icon: Icon(Icons.arrow_back)
        ),
      ),
      body: DetailsBodyAdmin(
        productAdmin: productAdmin,
      ),
    );
  }
}
