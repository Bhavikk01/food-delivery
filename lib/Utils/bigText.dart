import 'package:flutter/material.dart';

import 'dimentions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText({Key? key, this.color=const Color(0xff00c2cb),required this.text,this.overflow=TextOverflow.ellipsis,this.size=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
      color: color,
      fontSize: size==0? Dimensions.font20:size,
      fontWeight: FontWeight.w400,
    ),
    );
  }
}
