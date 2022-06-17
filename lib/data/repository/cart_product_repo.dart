import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/cart_model.dart';

class CartProductRepo {
  final SharedPreferences sharedPreferences;
  CartProductRepo({required this.sharedPreferences});
  List<String> cart=[];
  List<String> cartHistory = [];
  void addToCartList(List<CartModel> cartItems){
    /*sharedPreferences.remove("cart-list");
    sharedPreferences.remove("cart-history-list");*/
    var time = DateTime.now().toString();
    cart=[];
    cartItems.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element)
      );
    });
    sharedPreferences.setStringList("cart-list", cart);
  }

  List<CartModel> getCartList(){
    List<String> carts=[];
    if(sharedPreferences.containsKey("cart-list")){
      carts=sharedPreferences.getStringList("cart-list")!;
    }
    List<CartModel> cart=[];
    carts.forEach((element) {
      cart.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cart;
  }

  List<CartModel> getCartHistory(){
    if(sharedPreferences.containsKey("cart-history-list")){
      cartHistory=[];
      cartHistory = sharedPreferences.getStringList("cart-history-list")!;
    }
    List<CartModel> cartListHistory=[];
    cartHistory.forEach((element) {
      cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartListHistory;
  }

  void addToCartHistoryList(){
    if(sharedPreferences.containsKey("cart-history-list")){
      cartHistory = sharedPreferences.getStringList("cart-history-list")!;
    }
    for(int i=0;i<cart.length;i++)
      {
        // print("history list :\n"+cart[i]);
        cartHistory.add(cart[i]);
      }
    removeCart();
    sharedPreferences.setStringList("cart-history-list", cartHistory);
  }

  void removeCart(){
    cart=[];
    sharedPreferences.remove("cart-list");
  }

}