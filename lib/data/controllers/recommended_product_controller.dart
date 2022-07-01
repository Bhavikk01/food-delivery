// ignore_for_file: avoid_print

import 'package:get/get.dart';
import '../../models/popular_products_model.dart';
import '../repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList=[];
  List<dynamic> get recommendedProductList=> _recommendedProductList;
  bool _isloaded=false;
  bool get isLoaded =>_isloaded;

  Future<void> postRecommendedProduct(ProductModel productModel) async {
    recommendedProductRepo.postRecommendedProducts(productModel);
  }

  Future<void> getRecommendedProductList()async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      print("Got recommended Products");
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isloaded=true;
      update();
    }
  }
}