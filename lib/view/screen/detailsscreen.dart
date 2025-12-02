import 'package:estore/core/constant/routes.dart';
import 'package:estore/data/model/product.dart';
import 'package:estore/view/widget/details/detailsbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key,required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Get.offNamed(AppRoute.productScreen);
            },
            icon: Icon(Icons.arrow_back)
        ),
      ),
      body: DetailsBody(
        product: product,
      ),
    );
  }
}
