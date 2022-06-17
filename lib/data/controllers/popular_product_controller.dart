import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/data/controllers/cart_product_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/popular_products_model.dart';
import 'package:get/get.dart';
import '../../models/cart_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartProductController _cart;
  CartProductController get cart => _cart;

  bool _isloaded = false;
  bool get isLoaded => _isloaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;


  Future<void> postPopularProduct(ProductModel productModel) async {
    popularProductRepo.postPopularProducts(productModel);
  }

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("Got Products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isloaded = true;
      update();
    } else {
      print("Couldnt get my product");
    }
  }

  void setQuantity(bool isIncremented) {
    if (isIncremented) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + _quantity) < 0) {
      Get.snackbar("Item count", "Quantity can't be less then zero",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if ((_inCartItems + _quantity) > 20) {
      Get.snackbar("Item count", "Quantity can't add more",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartProductController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
  }

  void addItems(ProductModel product) {
    if (_quantity > 0) {
      _cart.addItem(product, _quantity);
      update();
      _quantity = 0;
      _inCartItems = 0;
      Get.snackbar("Item Count", "Product added successfully",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
    } else {
      Get.snackbar("Item Count", "You should add atleast one item in the cart",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
    }
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
