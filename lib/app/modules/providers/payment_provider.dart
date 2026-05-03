import 'package:flutter/material.dart';

/// ✅ NEW: Payment Provider
class PaymentProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void select(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}