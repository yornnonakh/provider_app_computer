import 'package:computer_app_provider/app/modules/model/products.dart';
import 'package:flutter/material.dart';


class CartProvider extends ChangeNotifier {
  List<Product> cartItem = [];

  // add product to cart
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

  // increment
  void increment(int index) {
    cartItem[index].stock = cartItem[index].stock + 1;
    notifyListeners();
  }

  // decrement
  void decrement(int index) {
    cartItem[index].stock = cartItem[index].stock - 1;
    if (cartItem[index].stock == 0) {
      cartItem.removeAt(index);
    }
    notifyListeners();
  }
  // total
  double total(){
    double sum = 0;
    for(int i=0;i<cartItem.length;i++){
       sum += cartItem[i].stock*cartItem[i].price;
    }
    return sum;
  }
}
