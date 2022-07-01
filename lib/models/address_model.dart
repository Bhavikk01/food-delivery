// ignore_for_file: unused_field

class AddressModel{

  late int? _id;
  late String _addressType;
  late String? _contactPersonName;
  late String? _contactPersonNumber;
  late String _address;
  late String _latitude;
  late String _longitude;

  AddressModel(
      {id,
      required addressType,
      contactPersonName,
      contactPersonNumber,
      required address,
      required latitude,
      required longitude}){
    _id = id;
    _contactPersonName = contactPersonName;
    _contactPersonNumber = contactPersonNumber;
    _addressType = addressType;
    _longitude = longitude;
    _latitude = latitude;
  }

  String get address => _address;
  String get addresstype => _addressType;
  String? get contactPersonName => _contactPersonName;
  String? get contactPersonNumber => _contactPersonNumber;
  String get latitude => _latitude;
  String get longitude => _longitude;


  AddressModel.fromJson(Map<String, dynamic> json){
    _id = json['id'];
    _addressType = json['addressType'];
    _contactPersonNumber = json['contactPersonNumber']?? "";
    _contactPersonName = json['contactPersonName']?? "";
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _address = json['address'];
  }

}