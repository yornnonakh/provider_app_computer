import 'package:computer_app_provider/app/modules/model/products.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cartItem = [];

  void addToCart(Product pro) {
    cartItem.add(
      Product(
        id: pro.id,
        name: pro.name,
        price: pro.price,
        image: pro.image,
        description: pro.description,
        category: pro.category,
        stock: pro.stock,
        specs: pro.specs,
      ),
    );
    notifyListeners();
  }

  void increment(int index) {
    cartItem[index].stock = cartItem[index].stock + 1;
    notifyListeners();
  }

  void decrement(int index) {
    cartItem[index].stock = cartItem[index].stock - 1;
    if (cartItem[index].stock == 0) {
      cartItem.removeAt(index);
    }
    notifyListeners();
  }

  double total() {
    double sum = 0;
    for (int i = 0; i < cartItem.length; i++) {
      sum += cartItem[i].stock * cartItem[i].price;
    }
    return sum;
  }

  void clearCart() {
  cartItem.clear();
  notifyListeners();
}
}
