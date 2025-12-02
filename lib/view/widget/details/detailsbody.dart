import 'package:estore/core/constant/color.dart';
import 'package:estore/data/model/product.dart';
import 'package:estore/view/widget/details/colordot.dart';
import 'package:estore/view/widget/details/productimage.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
       children: [
         Container(
           width: double.infinity,
           padding: EdgeInsets.symmetric(horizontal: 20*1.5),
           decoration: BoxDecoration(
             color: AppColor.primaryColor,
             borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(50),
               bottomRight: Radius.circular(50)
             )
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
                    Center(
                        child: ProductImage(
                            size: size,
                            image: product.image
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ColorDot(
                              fillColor: AppColor.grey,
                              isSelect: true,
                            ),
                            ColorDot(
                              fillColor: Colors.blue,
                              isSelect: false,
                            ),
                            ColorDot(
                              fillColor: Colors.red,
                              isSelect: false,
                            ),
                          ],
                        ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(product.title,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
                        ),
                    ),
                    Text("\$ ${product.price}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.amber
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                 ),
               ),
               Container(
                 margin: EdgeInsets.symmetric(vertical: 10),
                 padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                 child: Text(product.description,
                   style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.grey,fontSize: 20)
                 ),
               )
             ],
    );
  }
}
