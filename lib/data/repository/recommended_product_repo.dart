import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/models/popular_products_model.dart';
import 'package:get/get.dart';
import '../API/API_Client.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstant.recommendedProductUrl);
  }

  Future<Response> postRecommendedProducts(ProductModel productModel)async{
    Response response = await apiClient.postData(AppConstant.addrecommendedProductUrl, productModel);
    return response;
  }

}