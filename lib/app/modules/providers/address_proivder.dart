import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier{
   int selectedIndex=-1;
   void select(int index){
      selectedIndex = index;
      notifyListeners();
   }
}