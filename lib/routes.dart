import 'package:estore/core/constant/routes.dart';
import 'package:estore/core/middleware/mymiddleware.dart';
import 'package:estore/view/screen/adminadd.dart';
import 'package:estore/view/screen/adminproductscreen.dart';
import 'package:estore/view/screen/auth/detailsscreenadmin.dart';
//import 'package:estore/test.dart';
import 'package:estore/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:estore/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:estore/view/screen/auth/login.dart';
import 'package:estore/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:estore/view/screen/auth/signup.dart';
import 'package:estore/view/screen/auth/successsignup.dart';
import 'package:estore/view/screen/detailsscreen.dart';
import 'package:estore/view/screen/language.dart';
import 'package:estore/view/screen/money.dart';
import 'package:estore/view/screen/onboarding.dart';
import 'package:estore/view/screen/productscreen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>?routes=[
    GetPage(name: "/", page: ()=>Language(),middlewares: [
        MyMiddleWare()
     ]
    ),

    //GetPage(name: "/", page: ()=>Test()),
    GetPage(name: AppRoute.login, page: ()=>Login()),
    GetPage(name: AppRoute.signUp, page: ()=>SignUp()),
    GetPage(name: AppRoute.forgetPassword, page: ()=>ForgetPassword()),
    GetPage(name: AppRoute.resetPassword, page: ()=>ResetPassword()),
    GetPage(name: AppRoute.successResetPassword, page: ()=>SuccessResetPassword()),
    GetPage(name: AppRoute.successSignUp, page: ()=>SuccessSignUp()),
    GetPage(name: AppRoute.onBoarding, page: ()=>OnBoarding()),
    GetPage(name: AppRoute.productScreen, page: ()=>ProductScreen()),
    GetPage(name: AppRoute.detailsScreen, page:  (){
        final arguments =Get.arguments;
        return DetailsScreen(product: arguments);
    }),
    GetPage(name: AppRoute.detailsScreenAdmin, page:  (){
        final arguments =Get.arguments;
        return DetailsScreenAdmin(productAdmin: arguments);
    }),
    GetPage(name: AppRoute.money, page: ()=>CurrencyConverterPage()),
    GetPage(name: AppRoute.adminProductScreen, page: ()=>AdminProductScreen()),
    GetPage(name: AppRoute.adminAdd, page: ()=>AdminAdd()),

];
