import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/models/popular_products_model.dart';
import 'package:get/get.dart';
import '../API/API_Client.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstant.popularProductUrl);
  }

  Future<Response> postPopularProducts(ProductModel productModel)async{
    Response response = await apiClient.postData(AppConstant.addpopularProductUrl, productModel.toJson());
    return response;
  }

}