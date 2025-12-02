import 'package:estore/core/constant/color.dart';
import 'package:estore/data/model/productadmin.dart';
import 'package:flutter/material.dart';

class ProductCardAdmin extends StatelessWidget {
  const ProductCardAdmin({super.key, required this.itemIndex, required this.onPressed,required this.onLongPress, required this.productAdmin});

  final int itemIndex;
  final ProductAdmin productAdmin;
  final Function()? onPressed;
  final Function()? onLongPress;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        height: 190,
        child: InkWell(
          onTap: onPressed,
          onLongPress: onLongPress,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 166,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 25,
                        color: Colors.black45,
                      )
                    ]
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,),
                    height: 160,
                    width: 200,
                    child: Image.asset(
                      productAdmin.image,
                      fit: BoxFit.cover,
                    ),
                  )
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SizedBox(
                  height: 136,
                  width: size.width-200,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(productAdmin.title,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(productAdmin.subTitle,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.grey),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Text("\$ ${productAdmin.price}",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
