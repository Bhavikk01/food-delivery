import 'package:food_delivery/data/repository/location_repo.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController  extends GetxController implements GetxService{
  final LocationRepo locationRepo;

  LocationController({required this.locationRepo});

  bool _loading = false;
  late Position _position;
  late Position _pickPosition;
  Placemark _placeMark = Placemark();

  Placemark _pickPlaceMark = Placemark();
  List<AddressModel> _addressList = [];
  late List<AddressModel> _allAddressList;
  List<String> _addressTypeList = ['home','office', 'others'];
  int _addressTypeIndex = 0;
  late Map<String, dynamic> _getAddress ;
  late GoogleMapController _mapController;
  bool _updateAddressData = true;
  bool _changeAddress = true;


  void setMapController(GoogleMapController controller){
    _mapController = controller;
  }

  Future<void> updatePosition(CameraPosition position,bool fromAddress) async {
    if(_updateAddressData){
      _loading = true;
      update();
      try{

        if(fromAddress){
          _position = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1,
            accuracy: 1,
            speed: 1,
            speedAccuracy: 1,
            altitude: 1,
          );
        }else{
          _pickPosition = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1,
            accuracy: 1,
            speed: 1,
            speedAccuracy: 1, altitude: 1,
          );
        }

        if(_changeAddress){
          String _address = await getAddressFromGeocode(LatLng(position.target.latitude, position.target.longitude));
          fromAddress? _placeMark = Placemark(name: _address) : _pickPlaceMark = Placemark(name: _address);

        }

      }catch(e){
        print(e);
      }
    }
  }

  bool get loading => _loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;
  Placemark get pickPlaceMark => _pickPlaceMark;
  List<AddressModel> get addressList => _addressList;
  Map<String, dynamic> get getAddress => _getAddress;
  GoogleMapController get mapController => _mapController;
  Placemark get placeMark => _placeMark;

  Future<String> getAddressFromGeocode(LatLng latLang) async {
    String _address = "Unknown location found";
    Response response = await locationRepo.getAddressFromGeocode(latLang);

    if(response.body['status'] == 'OK'){
      _address = response.body['results'][0]['formatted_address'].toString();
    }else{
      print("Error while getting the address");
    }

    return _address;
  }

}