import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String category;
  final double price;
  final String tag;
  final String shopEmail;
  final dynamic product;
  int quantity;

  CartItem({
    required this.name,
    required this.category,
    required this.price,
    required this.tag,
    required this.shopEmail,
    required this.product,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double getTotalAmount() {
    return _cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _cartItems.remove(item);
    }
    notifyListeners();
  }
}