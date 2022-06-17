import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/Utils/bigText.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/Utils/dimentions.dart';
import 'package:food_delivery/Utils/small_text.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/controllers/recommended_product_controller.dart';
import 'package:food_delivery/models/popular_products_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/widgets/food_page_banners.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:food_delivery/widgets/recommended_food_list.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}
class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
      });
    });
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider Section
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return popularProduct.isLoaded? Container(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProduct.popularProductList.length,
                itemBuilder: (context, index) {
                  return _buildPageItem(index,popularProduct.popularProductList[index]);
                }
            ),
          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
        //Scrolling Dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.length==0? 1:popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius20)),
            ),

          );
        }),
        //Popular text
        SizedBox(height: Dimensions.height20),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text:".",color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: SmallText(text: "Food pairing")
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height30),
        //Recommended list of food and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?  MediaQuery.removePadding(
            context: context,
            removeTop: true,

            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: recommendedProduct.recommendedProductList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                      },
                      child: PopularFoodList(itemList: recommendedProduct.recommendedProductList[index]));
                }),
          ) : CircularProgressIndicator(color: AppColors.mainColor,);
        })
      ],
    );
  }
  Widget _buildPageItem(int index, ProductModel popularProduct) {
    
    return Stack(
      children: [
        GestureDetector(

          onTap: ()=>Get.toNamed(RouteHelper.getPopularFood(index)),

          child: Container(
            height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(right: Dimensions.width10,left: Dimensions.width10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven? const Color(0xff69c5df): Color(0xff00c2cb),
            image: DecorationImage(
              image: NetworkImage(AppConstant.baseUrl+AppConstant.uploadUrl+popularProduct.img!),
              fit: BoxFit.cover,
            )
          ),
      ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(right: Dimensions.width30,left: Dimensions.width30,bottom: Dimensions.height30),
            padding: EdgeInsets.only(top: Dimensions.height15,left: Dimensions.height15,right: Dimensions.height15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(5,5),
                    blurRadius: 5
                )
              ],
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
            ),
            child: FoodPageBanner(text: popularProduct.name.toString()),
          ),
        ),

    ]);
  }
}