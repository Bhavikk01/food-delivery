import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/bigText.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/Utils/dimentions.dart';
import 'package:food_delivery/Utils/small_text.dart';
import 'package:food_delivery/models/popular_products_model.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';

class FoodPagePopularBanner extends StatelessWidget {
  ProductModel itemlist;
  FoodPagePopularBanner({Key? key,required this.itemlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.height10,left: Dimensions.height10,right: Dimensions.height15,bottom: Dimensions.height10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigText(text: itemlist.name!,size: Dimensions.font20),
          SizedBox(height: Dimensions.height10/1.5),
          SmallText(text: itemlist.createdAt!),
          SizedBox(height: Dimensions.height10/1.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              IconAndTextWidget(icon: Icons.circle, iconColor: Colors.orange, text: "Normal"),
              IconAndTextWidget(icon: Icons.location_on, iconColor: Colors.greenAccent, text: "1.7km"),
              IconAndTextWidget(icon: Icons.access_time, iconColor: Colors.red, text: "32min"),
            ],
          ),

        ],
      ),
    );
  }
}
