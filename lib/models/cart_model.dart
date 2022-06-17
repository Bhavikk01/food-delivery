import 'package:food_delivery/models/popular_products_model.dart';

class CartModel{
  int? id;
  String? name;
  int? price;
  bool? isExist;
  String? time;
  int? quantity;
  String? img;
  ProductModel? product;

  CartModel(
      {this.time,
      this.isExist,
      this.quantity,
      this.id,
      this.name,
      this.img,
      this.price,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    time = json['time'];
    isExist =json['isExist'];
    product = ProductModel.fromJson(json['products']);
  }

  Map<String, dynamic> toJson(){
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "img": this.img,
      "quantity": this.quantity,
      "time": this.time,
      "isExist": this.isExist,
      "products": this.product!.toJson(),
    };
  }

}