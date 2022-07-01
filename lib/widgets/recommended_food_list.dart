// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/Utils/dimentions.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/models/popular_products_model.dart';
import 'package:food_delivery/widgets/food_page_popular_banner.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PopularFoodList extends StatelessWidget {
  ProductModel itemList;
  PopularFoodList({required this.itemList,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
      child: Row(
        children: [
          //Image Part
          GetBuilder<PopularProductController>(builder: (popularProduct) {
            return Container(
              width: Dimensions.listViewImage,
              height: Dimensions.listViewImage,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white38,
                image: DecorationImage(
                  image: NetworkImage(AppConstant.imageLoadingUrl+AppConstant.uploadUrl+itemList.img!),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
          //Text Part
          Expanded(
            child: Container(
              height: Dimensions.listViewTextContainer,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  bottomRight: Radius.circular(Dimensions.radius20),

                ),

              ),
                child: FoodPagePopularBanner(itemlist: itemList)
            ),
          )
        ],
      ),
    );
  }
}
