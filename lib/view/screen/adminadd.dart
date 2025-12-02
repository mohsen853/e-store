import 'package:estore/core/constant/color.dart';
import 'package:estore/core/constant/routes.dart';
import 'package:estore/core/function/validinput.dart';
import 'package:estore/data/model/product.dart';
import 'package:estore/view/widget/auth/custombuttonauth.dart';
import 'package:estore/view/widget/auth/customtextformauth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estore/core/constant/imageasset.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AdminAdd extends StatefulWidget {
  const AdminAdd({super.key});

  @override
  State<AdminAdd> createState() => _AdminAddState();
}

class _AdminAddState extends State<AdminAdd> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController title = TextEditingController();
  final TextEditingController subTitle = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  File? _selectedImage;
  String _imageUrl = AppImageAsset.moneyExchange;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> addProduct() async {
    if (formState.currentState!.validate()) {
      try {
        int newId = DateTime.now().millisecondsSinceEpoch;

        if (_selectedImage != null) {
          final ref = FirebaseStorage.instance
              .ref()
              .child('product_images/$newId.jpg');

          await ref.putFile(_selectedImage!);
          _imageUrl = await ref.getDownloadURL();
        }

        Product newProduct = Product(
          id: newId,
          price: int.parse(price.text),
          title: title.text,
          subTitle: subTitle.text,
          description: description.text,
          image: _imageUrl,
        );

        await FirebaseFirestore.instance
            .collection('products')
            .doc(newId.toString())
            .set(newProduct.toJson());

        Get.snackbar(
          "32".tr,
          "105".tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.primaryColor,
          colorText: Colors.white,
        );

        Get.offNamed(AppRoute.adminProductScreen);
      } catch (e) {
        Get.snackbar(
          "104".tr,
          "106".tr+": ${e.toString()}".tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "91".tr,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontSize: 25, color: AppColor.grey),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offNamed(AppRoute.adminProductScreen);
            },
            icon: Icon(Icons.arrow_back)
        ),
      ),
      body: Form(
          key: formState,
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(15),
            child: ListView(
              children: [
                SizedBox(height: 10),
                Column(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _selectedImage != null
                            ? Image.file(_selectedImage!, fit: BoxFit.cover)
                            : Icon(Icons.add_photo_alternate, size: 50, color: AppColor.grey),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "101".tr,
                      style: TextStyle(color: AppColor.grey),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextFormAuth(
                    hintText: "93".tr,
                    labelText: "94".tr,
                    iconData: Icons.title,
                    myController: title,
                    valid: (val) {
                      return validInput(val!, 5, 100, "title");
                    },
                    isNumber: false
                ),
                SizedBox(height: 10),
                CustomTextFormAuth(
                    hintText: "95".tr,
                    labelText: "96".tr,
                    iconData: Icons.subtitles,
                    myController: subTitle,
                    valid: (val) {
                      return validInput(val!, 5, 200, "subtitle");
                    },
                    isNumber: false
                ),
                SizedBox(height: 10),
                CustomTextFormAuth(
                    hintText: "97".tr,
                    labelText: "98".tr,
                    iconData: Icons.description,
                    myController: description,
                    valid: (val) {
                      return validInput(val!, 10, 500, "description");
                    },
                    isNumber: false
                ),
                SizedBox(height: 10),
                CustomTextFormAuth(
                    hintText: "99".tr,
                    labelText: "100".tr,
                    iconData: Icons.attach_money,
                    myController: price,
                    valid: (val) {
                      return validInput(val!, 1, 10, "price");
                    },
                    isNumber: true
                ),
                SizedBox(height: 20),
                CustomButtonAuth(
                  text: "102".tr,
                  onPressed: addProduct,
                ),
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    title.dispose();
    subTitle.dispose();
    description.dispose();
    price.dispose();
    super.dispose();
  }
}