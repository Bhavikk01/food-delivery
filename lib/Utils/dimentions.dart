import 'package:get/get.dart';

class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageView = screenHeight/2.64;

  //For height padding and margin
  static double height10 = screenHeight/84.4;
  static double height20 = screenHeight/42.2;
  static double height15 = screenHeight/56.27;
  static double height30 = screenHeight/28.18;
  static double height40 = screenHeight/21.1;

  //For Width padding and margin
  static double width10 = screenHeight/84.4;
  static double width20 = screenHeight/42.2;
  static double width15 = screenHeight/56.27;
  static double width30 = screenHeight/28.18;
  static double font20 = screenHeight/38.2;
  static double font26 = screenHeight/32.46;
  static double font16 = screenHeight/52.75;
  static double font12 = screenHeight/60.33;
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;

  static double pageViewContainer = screenHeight/3.84;
  static double pageViewTextContainer = screenHeight/7.03;

  //List view image size
  static double listViewImage = screenWidth/3.25;
  static double listViewTextContainer = screenWidth/3.9;

  static double popularFoodImgSize = screenHeight/2.41;
  static double iconSize24 = screenHeight/35.17;
  static double iconSize16 = screenHeight/52.75;

  //bottom height
  static double bottomHeightBar = screenHeight/7.03;
}