import 'package:estore/core/constant/imageasset.dart';
import 'package:get/get.dart';

class Product{
  final int id;
  final int price;
  final String title;
  final String subTitle;
  final String description;
  final String image;

  Product(
      { required this.id,
        required this.price,
        required this.title,
        required this.subTitle,
        required this.description,
        required this.image});

  Map<String, dynamic> toJson() => {
    'id': id,
    'price': price,
    'title': title,
    'subTitle': subTitle,
    'description': description,
    'image': image,
  };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    price: json['price'],
    title: json['title'],
    subTitle: json['subTitle'],
    description: json['description'],
    image: json['image'],
  );
}



List<Product> products = [
  Product(
    id: 1,
    price: 59,
    title: "58".tr,
    subTitle: "59".tr,
    image: AppImageAsset.airpod,
    description:"60".tr,
  ),
  Product(
    id: 2,
    price: 1099,
    title: "61".tr,
    subTitle: "62".tr,
    image: AppImageAsset.mobile,
    description: "63".tr,
  ),
  Product(
    id: 3,
    price: 39,
    title: "64".tr,
    subTitle: "65".tr,
    image: AppImageAsset.classs,
    description: "66".tr,
  ),
  Product(
    id: 4,
    price: 56,
    title: "67".tr,
    subTitle: "68".tr,
    image: AppImageAsset.headset,
    description: "69".tr,
  ),
  Product(
    id: 5,
    price: 68,
    title: "70".tr,
    subTitle: "71".tr,
    image: AppImageAsset.speaker,
    description: "72".tr,
  ),
  Product(
    id: 6,
    price: 39,
    title: "73".tr,
    subTitle: "74".tr,
    image: AppImageAsset.camera,
    description: "75".tr,
  ),
];
