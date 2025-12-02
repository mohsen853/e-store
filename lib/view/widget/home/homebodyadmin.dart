import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estore/core/constant/color.dart';
import 'package:estore/core/constant/routes.dart';
import 'package:estore/data/model/productadmin.dart';
import 'package:estore/view/widget/home/productcardadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBodyAdmin extends StatefulWidget {
  const HomeBodyAdmin({super.key});

  @override
  State<HomeBodyAdmin> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBodyAdmin> {

  List<ProductAdmin> firebaseProductAdmin=[];

  bool isLoading=true;


  getData() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("products").get();
    firebaseProductAdmin = querySnapshot.docs.map((doc) {
      return ProductAdmin(
          id: doc["id"],
          price: doc["price"],
          title: doc["title"],
          subTitle: doc["subTitle"],
          description: doc["description"],
          image: doc["image"]
      );
    }
    ).toList();
    productAdmin.addAll(firebaseProductAdmin);
    setState(() {
      isLoading=false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                      ),
                      margin: EdgeInsets.only(top: 70),
                    ),isLoading
                        ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                    :ListView.builder(
                      itemCount: firebaseProductAdmin.length,
                      itemBuilder: (context,index)=>ProductCardAdmin(
                        itemIndex: index,
                        productAdmin: firebaseProductAdmin[index],
                        onPressed: (){
                          Get.offNamed(AppRoute.detailsScreenAdmin,arguments: firebaseProductAdmin[index]);
                        },
                        onLongPress: (){
                          Get.defaultDialog(
                              title: "107".tr,
                              middleText: "108".tr,
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                      await FirebaseFirestore.instance.collection("products")
                                          .doc("${firebaseProductAdmin[index].id}").delete();
                                      setState(() {
                                        firebaseProductAdmin.removeAt(index);
                                      });

                                      Get.back();
                                    },
                                    child: Text("109".tr)
                                ),
                                ElevatedButton(
                                    onPressed: (){
                                      Get.back();
                                    },
                                    child: Text("56".tr)
                                )
                              ]
                          );
                          return Future.value(true);
                        },
                      ),
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}