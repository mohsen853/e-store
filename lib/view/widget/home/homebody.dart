import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estore/core/constant/color.dart';
import 'package:estore/core/constant/routes.dart';
import 'package:estore/data/model/product.dart';
import 'package:estore/view/widget/home/productcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  List<Product> firebaseProduct=[];
  List<Product> allProduct=[];

  bool isLoading=true;

  getData() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("products").get();
    firebaseProduct = querySnapshot.docs.map((doc) {
      return Product(
          id: doc["id"],
          price: doc["price"],
          title: doc["title"],
          subTitle: doc["subTitle"],
          description: doc["description"],
          image: doc["image"]
      );
    }
    ).toList();
    allProduct=[...products,...firebaseProduct];
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
                        itemCount: allProduct.length,
                        itemBuilder: (context,index)=>ProductCard(
                          itemIndex: index,
                          product: allProduct[index],
                          onPressed: (){
                            Get.offNamed(AppRoute.detailsScreen,arguments: allProduct[index]);
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

/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estore/core/constant/color.dart';
import 'package:estore/core/constant/routes.dart';
import 'package:estore/data/model/product.dart';
import 'package:estore/view/widget/home/productcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<Product> firebaseProduct = [];
  List<Product> allProduct = [];
  bool isLoading = true; // إضافة متغير لتتبع حالة التحميل

  getData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("products").get();
      firebaseProduct = querySnapshot.docs.map((doc) {
        return Product(
          id: doc["id"],
          price: doc["price"],
          title: doc["title"],
          subTitle: doc["subTitle"],
          description: doc["description"],
          image: doc["image"],
        );
      }).toList();
      allProduct = [...products, ...firebaseProduct];
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      setState(() {
        isLoading = false; // تعطيل حالة التحميل عند اكتمال العملية
      });
    }
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
          const SizedBox(height: 10),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 70),
                ),
                isLoading
                    ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white, // يمكنك تغيير اللون حسب احتياجاتك
                  ),
                )
                    : ListView.builder(
                  itemCount: allProduct.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: allProduct[index],
                    onPressed: () {
                      Get.offNamed(
                        AppRoute.detailsScreen,
                        arguments: allProduct[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/
