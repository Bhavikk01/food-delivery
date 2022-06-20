import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/Home/home_page.dart';
import 'package:food_delivery/Pages/Home/main_food_page.dart';
import 'package:food_delivery/Pages/address/add_address_page.dart';
import 'package:food_delivery/Pages/auth/sign_in_page.dart';
import 'package:food_delivery/Pages/auth/sign_up_page.dart';
import 'package:food_delivery/adminPage/AdminHome.dart';
import 'package:food_delivery/data/controllers/cart_product_controller.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<CartProductController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 194, 203)
              ),
              primaryColor: const Color.fromARGB(255, 0, 194, 203)
          ),
          home: const HomePage(),
          initialRoute: RouteHelper.initial,
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}