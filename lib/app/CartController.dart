import 'package:get/get.dart';
import 'package:e_commerce/api/items_model.dart'; // Make sure to import the Products model

class CartController extends GetxController {
  var cartItems = <Products>[].obs;

  void addToCart(Products product) {
    cartItems.add(product);
  }

  void removeFromCart(Products product) {
    cartItems.remove(product);
  }

  // Optional: Add a method to calculate the total price
  double get totalPrice {
    return cartItems.fold<double>(
      0.0,
      (sum, product) => sum + product.price,
    );
  }
}
