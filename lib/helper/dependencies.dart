import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/data/API/API_Client.dart';
import 'package:food_delivery/data/controllers/auth_controller.dart';
import 'package:food_delivery/data/controllers/location_controller.dart';
import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/data/repository/cart_product_repo.dart';
import 'package:food_delivery/data/repository/location_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/controllers/cart_product_controller.dart';
import '../data/controllers/popular_product_controller.dart';
import '../data/controllers/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(()=> sharedPreferences);
  //api client
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstant.baseUrl));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartProductRepo(sharedPreferences: Get.find()));
  Get.lazyPut(()=> AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(()=> LocationRepo(apiClient: Get.find(), sharedPreference: Get.find()));

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartProductController(cartRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));

}