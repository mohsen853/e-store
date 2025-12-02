import 'package:estore/core/constant/color.dart';
import 'package:flutter/material.dart';

class ColorDot  extends StatelessWidget {
  const ColorDot ({super.key, required this.fillColor,this.isSelect=false});

  final Color fillColor;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelect?AppColor.grey:Colors.transparent)
      ),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: fillColor
        ),
      ),
    );
  }
}
