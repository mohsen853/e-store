import 'package:estore/core/constant/color.dart';
import 'package:estore/core/constant/imageasset.dart';
import 'package:estore/core/constant/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  CurrencyConverterPageState createState() => CurrencyConverterPageState();
}

class CurrencyConverterPageState extends State<CurrencyConverterPage> {
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double amount = 1.0;
  double convertedAmount = 0.0;
  double exchangeRate = 0.0;
  bool isLoading = false;
  bool isAdmin = false;

  final List<String> currencies = [
    'USD', 'EUR', 'GBP', 'JPY', 'AUD', 'CAD', 'CHF', 'CNY', 'SAR', 'AED'
  ];

  @override
  void initState() {
    super.initState();
    checkUserType();
    convertCurrency();
  }

  Future<void> checkUserType() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          isAdmin = userDoc.get('isAdmin') ?? false;
        });
      }
    }
  }

  Future<void> convertCurrency() async {
    setState(() => isLoading = true);

    try {
      final response = await http.get(
        Uri.parse('https://api.exchangerate-api.com/v4/latest/$fromCurrency'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          exchangeRate = data['rates'][toCurrency].toDouble();
          convertedAmount = amount * exchangeRate;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            "${"92".tr}$e",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.grey),
          ),
          )
      );
      }
      }

  void navigateBack() {
    Get.offAllNamed(isAdmin ? AppRoute.adminProductScreen : AppRoute.productScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "77".tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: navigateBack,
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              AppImageAsset.moneyExchange,
              height: 200,
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: fromCurrency,
                    items: currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.grey)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() => fromCurrency = newValue!);
                      convertCurrency();
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "78".tr,
                        labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.grey)
                    ),
                    onChanged: (value) {
                      setState(() => amount = double.tryParse(value) ?? 0.0);
                      convertCurrency();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: toCurrency,
                    items: currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.grey)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() => toCurrency = newValue!);
                      convertCurrency();
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text(convertedAmount.toStringAsFixed(2),style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.grey)),
                ),
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              '${"79".tr} $fromCurrency = ${exchangeRate.toStringAsFixed(4)} $toCurrency',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.grey),
            ),
          ],
        ),
      ),
    );
  }
}