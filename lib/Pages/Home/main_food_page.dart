import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/dimentions.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/controllers/recommended_product_controller.dart';
import 'package:food_delivery/widgets/food_page_body.dart';
import 'package:get/get.dart';
import '../../widgets/main_page_header.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {

  Future<void> _loadResources()async{
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _loadResources,
      child: Scaffold(
        body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimensions.height40,bottom: Dimensions.height15),
            padding: EdgeInsets.only(right: Dimensions.width20,left: Dimensions.width20),
            child: const MainPageHeader(),
          ),
          const Expanded(
              child: SingleChildScrollView(
                child:  FoodPageBody(),
              )
          ),

        ],
    ),
      ),

    );
  }
}
