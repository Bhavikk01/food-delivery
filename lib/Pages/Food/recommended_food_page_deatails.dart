// ignore_for_file: use_full_hex_values_for_flutter_colors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/Utils/bigText.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/Utils/dimentions.dart';
import 'package:food_delivery/Utils/icon_style.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/controllers/recommended_product_controller.dart';
import 'package:get/get.dart';
import '../../data/controllers/cart_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../Utils/expandable_text.dart';

class RecommendedFoodDetails extends StatelessWidget {

  int pageId;
  RecommendedFoodDetails({required this.pageId,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(Get.find<CartProductController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: ()=> Get.toNamed(RouteHelper.getInitial()),
                    child: const AppIcon(icon: Icons.clear)
                ),
                GetBuilder<PopularProductController>(builder: (popularProduct){

                  return Stack(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RouteHelper.getCartPage());
                          },
                          child: const AppIcon(icon: Icons.shopping_cart_outlined)
                      ),
                      popularProduct.totalItems>=1?
                      const Positioned(
                        right: 0,
                        top: 0,
                        child: AppIcon(
                          icon: Icons.circle,
                          size: 20,
                          iconColor: Colors.transparent,
                          backgroundColor: AppColors.mainColor,
                        ),
                      ) : Container(),
                      Positioned(
                        top: 2,
                        right: 2,
                        child: BigText(text: popularProduct.totalItems.toString(),color: Colors.white,size: Dimensions.font12,),
                      )
                    ],
                  );
                })
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight:Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20)
                  )
                ),
                child: Center(child: BigText(text: product.name!,size: Dimensions.font20)),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5,bottom: 10),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstant.imageLoadingUrl+AppConstant.uploadUrl+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                  child: ExpandableText(text:product.description!),
                ),
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) {

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(right: Dimensions.width20*2.5,left: Dimensions.width20*2.5,top: Dimensions.height10,bottom: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: AppIcon(
                          icon: Icons.remove,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24
                      )
                  ),
                  BigText(text: "\$ ${product.price!} X ${popularProduct.quantity}",color: Colors.black,size: Dimensions.font26),
                  GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: AppIcon(
                          icon: Icons.add,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize:Dimensions.iconSize24
                      )
                  ),
                ],

              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,right: Dimensions.width20,left: Dimensions.width20),
              decoration: BoxDecoration(
                  color: const Color(0xFF9B9BA1FF),
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
                    child: Icon(Icons.favorite,color: AppColors.mainColor,size: Dimensions.iconSize24*1.3),
                  ),
                  GestureDetector(

                    onTap: () {
                      popularProduct.addItems(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height10*1.5,bottom: Dimensions.height10*1.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white
                      ),
                        child: BigText(text: "\$ ${product.price!} | Add to cart",)
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      })
    );
  }
}
