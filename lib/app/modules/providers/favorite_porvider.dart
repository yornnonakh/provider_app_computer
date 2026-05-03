import 'package:flutter/material.dart';
import '../model/products.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  bool isFavorite(Product product) {
    return _favorites.any((item) => item.id == product.id);
  }

  void toggleFavorite(Product product) {
    final index = _favorites.indexWhere((item) => item.id == product.id);

    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add(product);
    }

    notifyListeners(); // 🔥 THIS IS THE KEY
  }
}
