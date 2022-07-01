// ignore_for_file: unnecessary_this

class AuthModel{
  String? name;
  String? password;
  String? phone;
  String? email;

  AuthModel({required this.name,required this.password,required this.phone,required this.email});

  AuthModel.fromMap(Map<String, dynamic> json){
    name= json['name'];
    password= json['password'];
    phone = json['phone'];
    email= json['email'];
  }

  Map<String, dynamic> toJson(AuthModel user){

    final Map<String, dynamic> data = <String, dynamic>{};
    data['f_name'] = this.name;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }



}