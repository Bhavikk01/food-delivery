import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/bigText.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/Utils/small_text.dart';

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(text: "India",color: AppColors.mainColor),
            Row(
              children: [
                SmallText(text:"Rajasthan",color: Colors.black54,),
                const Icon(Icons.arrow_drop_down),
              ],
            )
          ],
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(15)
          ),
          child: const Icon(Icons.search,color: Colors.white),
        )
      ],
    );
  }
}
