// ignore_for_file: unnecessary_this, unused_field

class Product{
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List <ProductModel> _products;
  List<ProductModel> get products=> _products;

  Product({required totalSize,required typeId,required offset,required products}){
    this._totalSize=totalSize;
    this._offset=offset;
    this._typeId=typeId;
    this._products=products;
  }

  Product.fromJson(Map<String, dynamic> json){
    _totalSize=json['totalSize'];
    _typeId=json['typeId'];
    _offset=json['offset'];
    if(json['products']!=null){
      _products=<ProductModel> [];
      json['products'].forEach((e){
        _products.add(ProductModel.fromJson(e));
      });
    }
  }

}
class ProductModel{
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? updatedAt;
  String? createdAt;
  int? typeId;

  ProductModel(this.id, this.name, this.description, this.price, this.stars,
      this.img, this.location, this.updatedAt, this.createdAt, this.typeId);

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson(){



    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "description": this.description,
      "img": this.img,
      "stars": this.stars,
      "location": this.location,
      "createdAt": this.createdAt,
      "updatedAt": this.updatedAt,
      "typeId": this.typeId
    };
  }
}
