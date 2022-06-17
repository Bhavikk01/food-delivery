import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/Home/main_food_page.dart';
import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/Utils/dimentions.dart';
import 'package:food_delivery/Utils/expandable_text.dart';
import 'package:food_delivery/widgets/food_page_banners.dart';
import 'package:get/get.dart';
import '../../Utils/bigText.dart';
import '../../Utils/icon_style.dart';
import '../../data/controllers/cart_product_controller.dart';
import '../../data/controllers/popular_product_controller.dart';
import '../../routes/route_helper.dart';

class PopularFoodDetails extends StatelessWidget {

  int pageId;
  PopularFoodDetails({required this.pageId,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(Get.find<CartProductController>());


    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(AppConstant.baseUrl+AppConstant.uploadUrl+product.img!),
                    fit: BoxFit.cover,
                  )
                ),
              )
          ),
          //icon widget
          Positioned(
            top: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){
                      Get.to(()=> const MainFoodPage());
                    },
                    child: const AppIcon(icon: Icons.arrow_back_ios)),

                GetBuilder<PopularProductController>(builder: (popularProduct){

                  return Stack(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RouteHelper.getCartPage());
                          },
                          child: const AppIcon(icon: Icons.shopping_cart_outlined)),
                      popularProduct.totalItems>=1?
                      Positioned(
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
          ),
          //introduction to food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize-20,
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height15,left: Dimensions.height15,right: Dimensions.height15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodPageBanner(text: product.name!),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduce",size: Dimensions.font20),
                  SizedBox(height: Dimensions.height10),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                        child: ExpandableText(text: product.description!),
                    ),
                  )
                ],
              ),
            ),
          ),
          //expandable text view
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,right: Dimensions.width20,left: Dimensions.width20),
          decoration: BoxDecoration(
              color: Color(0xFF9B9BA1FF),
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
                    GestureDetector(
                        onTap:(){
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove)),
                    SizedBox(width: Dimensions.width10/2),
                    BigText(text: popularProduct.quantity.toString(),size: Dimensions.font26),
                    SizedBox(width: Dimensions.width10/2),
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  popularProduct.addItems(product);
                },
                child: Container(
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height10*1.5,bottom: Dimensions.height10*1.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white
                  ),
                  child: BigText(text: "\$ ${product.price!} | Add to cart",),
                ),
              ),
            ],
          ),
        );
      })
    );
  }
}
