import 'package:estore/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, sup, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        onPressed :onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(textButton,style: TextStyle(
            fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
}
