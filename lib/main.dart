import 'package:estore/core/localization/changelocal.dart';
import 'package:estore/core/localization/translation.dart';
import 'package:estore/core/services/services.dart';
import 'package:estore/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('=========================User is currently signed out!');
      } else {
        print('=========================User is signed in!');
      }
    });
    super.initState();
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller=Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      title: 'E-Store',
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      theme:controller.appTheme,
      //routes: routes,
      getPages: routes,
    );
  }
}

