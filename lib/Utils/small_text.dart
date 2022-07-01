// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'dimentions.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  SmallText({
    Key? key,
    this.color=const Color(0xffccc7c5),
    this.height=1.2,
    required this.text,this.size=12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
      color: color,
      fontSize: size==12?Dimensions.font12: size,
      height: height,
      fontFamily: 'Roboto',
    ),
    );
  }
}
