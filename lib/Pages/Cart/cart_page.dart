// ignore_for_file: use_full_hex_values_for_flutter_colors, avoid_print

import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/Home/main_food_page.dart';
import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/Utils/bigText.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/Utils/dimentions.dart';
import 'package:food_delivery/Utils/icon_style.dart';
import 'package:food_delivery/Utils/small_text.dart';
import 'package:food_delivery/data/controllers/cart_product_controller.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import '../../data/controllers/recommended_product_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height30*2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                  ),
                  SizedBox(width: Dimensions.width20*5),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> const MainFoodPage());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              )
          ),
          Positioned(
            top: Dimensions.height20*5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartProductController>(builder: (cartProduct) {
                    return ListView.builder(
                        itemCount: cartProduct.getItems.length,
                        itemBuilder: (_, index) {
                          return SizedBox(
                              height: Dimensions.height20 * 5,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      var popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(cartProduct.getItems[index].product);
                                      if(popularIndex>=0){
                                        Get.toNamed(RouteHelper.getPopularFood(popularIndex)
                                            );
                                      }else{
                                        var recommendedIndex = Get.find<RecommendedProductController>().recommendedProductList.indexOf(cartProduct.getItems[index].product);
                                        Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex));
                                      }
                                    },
                                    child: Container(
                                      width: Dimensions.height20 * 5,
                                      height: Dimensions.height20 * 5,
                                      margin: EdgeInsets.only(
                                        bottom: Dimensions.height10,),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                          color: Colors.white,
                                          image: DecorationImage(
                                            image: NetworkImage(AppConstant.imageLoadingUrl+AppConstant.uploadUrl+cartProduct.getItems[index].img!),
                                            fit: BoxFit.cover,
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.width10),
                                  Expanded(
                                    child: SizedBox(
                                      height: Dimensions.height20 * 5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          BigText(text: cartProduct.getItems[index].name!,
                                              color: Colors.black),
                                          SmallText(text: "Spicy"),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              BigText(text: "\$ ${cartProduct.getItems[index].price!}",
                                                color: Colors.redAccent,),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: Dimensions.height10,
                                                    bottom: Dimensions.height10,
                                                    left: Dimensions.width10,
                                                    right: Dimensions.width10),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      Dimensions.radius30),
                                                  color: Colors.white,
                                                ),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          cartProduct.addItem(cartProduct.getItems[index].product!, -1);
                                                        },
                                                        child: const Icon(
                                                            Icons.remove)),
                                                    SizedBox(width: Dimensions
                                                        .width10 / 2),
                                                    BigText(text: cartProduct.getItems[index].quantity.toString(),
                                                        size: Dimensions
                                                            .font26),
                                                    SizedBox(width: Dimensions
                                                        .width10 / 2),
                                                    GestureDetector(
                                                        onTap: () {
                                                          cartProduct.addItem(cartProduct.getItems[index].product!,1);
                                                        },
                                                        child: const Icon(
                                                            Icons.add)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                          );
                        });
                  }
                  ),
                ),
              )
          )
        ],
      ),
        bottomNavigationBar: GetBuilder<CartProductController>(builder: (cartProduct){
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,right: Dimensions.width20,left: Dimensions.width20),
            decoration: BoxDecoration(
                color: const Color(0xff9b9ba1ff),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20*2),
                  topRight: Radius.circular(Dimensions.radius20*2),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: Dimensions.width10/2),
                      BigText(text: "\$ "+cartProduct.totalAmount.toString(),size: Dimensions.font26),
                      SizedBox(width: Dimensions.width10/2),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    print("tapped");
                    cartProduct.addToHistory();
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height10*1.5,bottom: Dimensions.height10*1.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white
                    ),
                    child: BigText(text: "Checkout"),
                  ),
                ),
              ],
            ),
          );
        })
    );
  }
}
