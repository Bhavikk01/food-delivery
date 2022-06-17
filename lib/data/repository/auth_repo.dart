import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/data/API/API_Client.dart';
import 'package:food_delivery/models/auth_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(AuthModel authmodel) async{

    Response response = await apiClient.postData(AppConstant.registrationUrl, authmodel);
    return response;
  }

}