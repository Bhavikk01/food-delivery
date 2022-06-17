import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/Utils/dimentions.dart';
import 'package:food_delivery/Utils/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key,required this.text}) : super(key: key);
  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {

  late String firstHalf;
  late String secondHalf;
  bool hiddenText=true;
  double textHeight = Dimensions.screenHeight/5.63;
  @override
  void initState() {
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }
    else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: secondHalf.isEmpty? SmallText(text: firstHalf) : Column(
        children: [
          SmallText(text:  hiddenText? (firstHalf+"..."): (firstHalf+" "+secondHalf),size: Dimensions.font16,color: Color(0xFF000000)),
          SizedBox(height: hiddenText? 0:Dimensions.height10),
          InkWell(
            onTap:(){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: hiddenText? "Show more" : "Show less" ,color: AppColors.mainColor),
                Icon(hiddenText? Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor),
              ],
            ),
          )

        ],
      )
    );
  }
}
