import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/data/API/API_Client.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo{

  final ApiClient apiClient;
  final SharedPreferences sharedPreference;

  LocationRepo({required this.sharedPreference, required this.apiClient});

  Future<Response> getAddressFromGeocode(LatLng latlng)async{
    return await apiClient.getData(
        '${AppConstant.geocodeUri}'
      '?Lat=${latlng.latitude}&lng=${latlng.longitude}'
    );
  }
}